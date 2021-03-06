---
title: Automatic iOS Wildcard Development Code Signing Files
date: 2016-06-07 16:44 UTC
tags: tutorial, announcement, code-signing
authors: Viktor Benei|viktorbenei@bitrise.io
---

We just pushed one more change (in addition to the one we described in our previous
[iOS Code Signing - a new method](/2016/06/06/ios-code-signing-a-new-method.html) blog post)
which should eliminate a frequent iOS code signing issue.

TL;DR

Till this point you had to use a workaround in some cases if you set your Xcode project settings to use Distribution
code signing and used e.g. CocoaPods iOS Framework dependencies in your project.
Now you don't have to do anything special other than uploading your Distribution profile 🎉

Read on for more details about the issue and our solution for it!


## What's the issue?

After iOS framework support was introduced dependency managers like CocoaPods adapted
quickly, to make it possible for you to manage your iOS framework dependencies in a unified way.
It's a fantastic thing as you can leverage the same tool to manage both "old school" sub-project based
dependencies as well as the new, framework based ones, all with the same tool!

The only issue is that iOS framework projects *require* code signing. This means that
e.g. CocoaPods generates a project for the framework with "iPhone Development" set
as code signing identity configuration.

On your local Mac this won't cause any issue, Xcode will pick your Wildcard Development
identity & profile for the framework targets **for an initial code signing**, and when you
export your app as an IPA Archive it'll just resign the whole app with the distribution
code signing files.

The problem is that you still need the Development code signing files to be available
for the initial "archive" operation (if you set your code signing settings to "Distribution" in Xcode),
which picks code signing files based on the project's
code signing settings.

![Common Distribution Code Signing configuration in Xcode](code-signing-config-in-xcode.png)

This means that in a clean environment like the Bitrise.io OS X virtual machines
there's no available Development profile by default. You either have to upload one
in addition to your Distribution profile, use a [workaround](https://github.com/CocoaPods/CocoaPods/issues/4331),
or specify an additional flag (`CODE_SIGN_IDENTITY="iPhone Distribution"`, as mentioned in our
previous [iOS Code Signing - a new method](/2016/06/06/ios-code-signing-a-new-method.html) blog post)
for `xcodebuild` for every command which requires
code signing (`analyze`, `archive`, ...).

We received countless of code signing error reports related to this issue,
so we decided to roll out a solution which solves it in a way which
is backward compatible and which resembles the common code signing setup
of a typical developer OS X machine.


## How it works

What [bitrise.io](https://www.bitrise.io/) does, is that after you upload your own Certificate
and Provisioning Profile (to bitrise.io), when a build starts [bitrise.io](https://www.bitrise.io/)
generates the *time limited/expiring* download URLs for the files and adds the URLs as environment variables
to the build.

Previously [bitrise.io](https://www.bitrise.io/) populated only the `$BITRISE_CERTIFICATE_URL`,
`$BITRISE_CERTIFICATE_PASSPHRASE` and `$BITRISE_PROVISION_URL` environment variables,
set to your files (expiring download URLs). The issue with this solution is that if
you forget to upload a Development code signing file pair
then you'll most likely face the issue described above.

What we changed is that the latest version of the `Certificate and profile installer` step now includes a
second set of inputs, which are set to the "magical" environment variables: `$BITRISE_DEFAULT_CERTIFICATE_URL`,
`$BITRISE_DEFAULT_CERTIFICATE_PASSPHRASE` and `$BITRISE_DEFAULT_PROVISION_URL`.

These environment variables will point to a Development certificate & provisioning profile pair
(generated by us),
a wildcard one which is enough to solve the iOS framework code signing issue.
The `Certificate and profile installer` step will download this additional code signing file pair
and will make it available on OS X. It won't force it, or do anything special with the files,
it'll just make it available so that if Xcode requires wildcard development code signing
files it'll find one.

**If you don't like this solution** you can disable it by setting empty strings to the related inputs:

<pre><code>- certificate-and-profile-installer:
        inputs:
        - default_certificate_url: ''
        - default_certificate_passphrase: ''
        - default_provisioning_profile_url: ''
</code></pre>

or by simply deleting the default values on the Web UI.

**You can of course set these inputs to another set of your own code signing files too**,
e.g. if you want to upload your own Development code signing files in addition to the
Distribution one. You can use
the [Generic File Storage](http://devcenter.bitrise.io/tutorials/how-to-use-the-generic-file-storage/)
feature to store your files,
and instead of adding a second `Certificate and profile installer` step you can just
specify your other files' download URL environment variables
(which will include time limited, expiring
download URLs as well if you use the Generic File Storage feature)
as the value for the "Default ..." inputs.

You can find **more in-depth description** about how iOS code signing works,
as well as **tips and tricks to make the process easier and more manageable**
on our [new, completely open source DevCenter](https://bitrise-io.github.io/devcenter/ios/code-signing/).
