---
title: Xcode 8 and automatic code signing
date: 2016-09-21 08:54 UTC
tags: tutorial, announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

If you tried to migrate to Xcode 8 and your build started to fail while you can
build it locally, there's a great chance that this is caused by the code signing changes
introduces in Xcode 8.

The blog post will cover:

1. Discovering the exact cause of the error
1. Description of how Xcode 8's new Automatic code signing feature works
1. Migrating your Bitrise configuration to Automatic code signing
1. Introducing our updated [`codesigndoc`](https://github.com/bitrise-tools/codesigndoc) tool,
   which is meant to help you with the "iOS code signing madness"

Feel free to skip any section and jump to the section you're interested in.


## Discovering the exact cause of the error

First of all, if you've just migrated to the Xcode 8 stack and your build fails
without any specific error in the log, or with just something like:

<pre><code>▸ Check Dependencies
** ARCHIVE FAILED **


The following build commands failed:
	Check dependencies
(1 failure)
</code></pre>

To get more details about the error, open your app's Workflow Editor on [bitrise.io](https://www.bitrise.io),
select the `Xcode Archive` step and set the `Output Tool` option of the step to `xcodebuild`.
The default value for this option is `xcpretty`, which seems to omit important details of the
new code signing error message.

The full `xcodebuild` (Xcode's command line tool) log should now include more info about the error,
something like:

<pre><code>Check dependencies
No profiles for 'io.bitrise.Xcode80WithTodayExtension.TodayExtension' were found:  Xcode couldn't find a provisioning profile matching 'io.bitrise.Xcode80WithTodayExtension.TodayExtension'.
Code signing is required for product type 'App Extension' in SDK 'iOS 10.0'

** ARCHIVE FAILED **


The following build commands failed:
	Check dependencies
(1 failure)
</code></pre>

For details about why this started to happen after you had migrated to Xcode 8,
when your project works with Xcode 7, please keep reading!


## Description of how Xcode 8's new Automatic code signing feature works

_If you're interested in all of the details, you should check this year's
[WWDC video which covers the code signing changes](https://developer.apple.com/videos/play/wwdc2016/401/).
We'll focus more on the basics and issue resolution here._

In short, Xcode 8's automatic code signing works this way:

1. When you do an Archive in Xcode, either in Xcode.app or on a CI server / through Xcode's command line tool (`xcodebuild`)
   it first creates an archive __signed with development code signing__.
1. Then, when you specify the distribution method (export method) it __resigns the archive with distribution signing__.

![Xcode Organizer - export method selector popup](xcode-organizer-export-method.png)

This means that if you want to create for example an App Store signed IPA,
on the Mac (e.g. on the [bitrise.io](https://www.bitrise.io) virtual machine)
you have to have __both a Wildcard, Team / Development AND the App Store
distribution certificates and provisioning profiles__!

_Collecting all of these might take quite a bit of time, but fortunately our
updated [`codesigndoc`](https://github.com/bitrise-tools/codesigndoc) can now collect
all of these files for you, automatically! You can find more information
about `codesigndoc` in the next section._

So, __does this automatic code signing worth all of this trouble__?
Should you instead opt to use manual code signing in Xcode 8?

In general using Automatic code signing is a good idea, and you should
migrate to it (as Apple suggests this is the new way, how you should do
code signing in the future) if you can.

__Does it worth the trouble?__ Well, __the good thing about Automatic code signing__
is that once you collected all the code signing files
__it's incredibly easy to use these files / to select the right file(s) during your build!__

All you need to do is specifying the "export method" (`app-store`, `ad-hoc`, etc.)
in the `Xcode Archive` step, and that's all! __Xcode will select the right certificate
and provisioning profiles automatically__, based on your project's
Team and Bundle ID (if the signing files are available in the system of course ;) )!

__Compare this with the previous solution__, where you had to either create multiple Schemes
in Xcode to be able to control where to use which code signing settings,
or you had to specify "Force Identity / Provisioning Profile" options,
which could lead to even more trouble when not configured properly.
In Xcode 8 automatic code signing you don't have to (actually, you can't)
mess with these configurations, initial code signing is always performed
with Development code signing, and Xcode resignes the IPA during export
based on the "export method".

And, __it works the same way on [bitrise.io](https://www.bitrise.io) too__!
Once you've uploaded all the required signing files (e.g. with [`codesigndoc`](https://github.com/bitrise-tools/codesigndoc)),
all you have to do is to set the `export method` option
of the `Xcode Archive` step to the option you want to use.
__That's all!__

This is the same as what you do when you create/export an iOS app archive
from Xcode.app - the `Xcode Archive` step just runs Xcode's command line tool.
There's no "magic" here, `Xcode Archive` just passes the export options
to Xcode, and Xcode creates the archive and IPA the same way it does on your Mac!


## Migrating your Bitrise configuration to Automatic code signing

First of all, you should upgrade your steps in your Workflow
to the latest versions - especially the `Certificate and profile installer`
and the `Xcode Archive` steps - as there are a couple of features
only available in the latest versions.

The second step is to __remove every previous, now incompatible code signing input
from the `Xcode Archive` step__.
In general you should try to __reset every code signing related input option of the `Xcode Archive` step__,
e.g. "Force code signing with Identity" and "Force code signing with Provisioning Profile Specifier".

_Note: it might be easier to see which input options you defined a value for in `bitrise.yml` mode
of the Workflow Editor. Just click on `bitrise.yml` on the left side of the Workflow Editor
and search for the `xcode-archive` step. In `bitrise.yml` only those inputs are listed which
you specified a value for / which are not set to their default value, so it should be pretty
quick to check the list there, easier than on the Web UI._

__You're almost ready__, really! All you have to do is:

1. Make sure that you've uploaded all the required code signing files, __including a Wildcard Team Development__
   certificate and provisioning profile, as noted in the __Description of how Xcode 8's new Automatic code signing feature works__ section.
   You might want to use [`codesigndoc`](https://github.com/bitrise-tools/codesigndoc) for this,
   as it can export all the required files automatically from your Mac.
1. Set the `Select method for export` input option of the `Xcode Archive` step to the
   method you want to use (e.g. `app-store` or `ad-hoc`)

__And that's all!__

_You can use multiple `Xcode Archive` steps to create multiple IPAs signed with different
code signing methods in the same build, just by adding a second `Xcode Archive` step
and setting the `Select method for export` option to the other method._

One note: if you'd have to use a distribution provisioning profile & certificate
which is related to a different Team, not the one set in your Xcode project's
settings, then you have to specify the `The Developer Portal team to use for this export`
input option too, or else Xcode will search for code signing files with the same Team ID
you have in your Xcode project's settings. Again, this is the same what you do in
Xcode.app when you create an Archive and export it with a distribution signing - if you're
part of more than one Apple Dev Portal team you'll be prompted to select one.

Another note, especially if your project includes Extension projects is that,
for some reason, Xcode 8.0 might not accept just any Wildcard Development Provisioning Profile
for the initial signing. It seems that in case of e.g. a Today Widget Extension
Xcode 8.0 requires the Wildcard __Team__ Provisioning Profile,
or a specific development one which includes the Extension's __full__ bundle ID.
This might be just an Xcode 8.0 issue which will be fixed in an upcoming Xcode 8 update,
but for now it's best to use the __Team__ Provisioning Profile, which you can
export from Xcode Preferences (Xcode -> Preferences -> select your Apple ID on the left side ->
select your Team on the right side -> click "View Details" -> search for
`iOS Team Provisioning Profile: *` -> right click "Show in Finder").
___[`codesigndoc`](https://github.com/bitrise-tools/codesigndoc) can help to
export the proper one in this case too!___


## Introducing our updated `codesigndoc` tool

If you didn't use [`codesigndoc`](https://github.com/bitrise-tools/codesigndoc) before,
you should definitely try it now!

The first version of the tool was released almost a year ago, well before the first Xcode 8 beta,
and was designed to help with common code signing issues in Xcode 7 projects.

We've just updated `codesigndoc` yesterday, and it can now help if your project
is set to use Xcode 8 automatic code signing!

In that case `codesigndoc` will export the development code signing files,
required for the _initial signing_ of the archive (if you skipped it,
you can read more about this in the __Description of how Xcode 8's new Automatic code signing feature works__ section),
as well as collecting all the Distribution Certificates and Provisioning Profiles
for your app (based on your project's selected Team ID and Bundle ID)!
All you have to do is running it on your Mac, and it'll collect everything for you!

__`codesigndoc` does not delete anything on your Mac, nor does it change your project__.
It's absolutely safe to use, all it does is:

1. Running an Xcode Archive on your Mac, and analyzing Xcode's Archive to see which code signing files
   it chose for the initial code signing, as well as for the Team and Bundle IDs.
1. Then it searches for these Certificates and Provisioning Profiles, and exports them into a single
   directory, without modifying the originals.

Of course you're free to [check its source code](https://github.com/bitrise-tools/codesigndoc),
as most of our tools `codesigndoc` is also open source ;)

_Just a final note - `codesigndoc` only works if you can successfully archive your project
on your own Mac. If you'd have any issue doing an archive on your Mac, you should
fix those first, and run `codesigndoc` once you were able to do a successful archive/export
from Xcode.app_

Happy Building! 🚀
