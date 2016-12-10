---
title: iOS Code Signing - a new method
date: 2016-06-06 09:04 UTC
tags: tutorial, announcement, code-signing
authors: Viktor Benei|viktorbenei@bitrise.io
---

Actually not a brand new method, but a refined one. Back in the Xcode 6 days
the default iOS project workflow Bitrise.io generated was configured to use
the `Force Code Signing` option (`Use force code signing attributes?`) of the `Xcode Archive` step,
based on the output of the `Certificate and profile installer` step.

What this method did: the `Certificate and profile installer` step downloads the
code signing Certificate (Identity) and the Provisioning Profile(s) you upload
to [bitrise.io](https://www.bitrise.io/), and in case you upload only a single
Identity (.p12) and Provisioning Profile pair it exports the unique identifier
of both code signing file into environment variables. The `Xcode Archive` step
(if the `Use force code signing attributes?` option is enabled) detects these
values and adds it the to `xcodebuild` command as `PROVISIONING_PROFILE`
and `CODE_SIGN_IDENTITY` parameters, forcing Xcode to use these code signing
settings, regardless of what value you have in your Xcode project settings.

This method worked reliably at that time, and made code signing quite a bit easier
than it is today.
But then iOS Frameworks and iOS app extensions (e.g. Watchkit or Today app extensions)
were introduced. Both are great additions to the iOS ecosystem, but both require
additional code signing configuration, requiring more than one Provisioning Profile.

This also meant that we could no longer use this setup as a reliable starter workflow,
as more and more projects started to leverage features which failed if
the `PROVISIONING_PROFILE` and `CODE_SIGN_IDENTITY` parameters were specified.


## Change in how you can force the code signing configurations

We removed the automatic value export as environment variable from the
latest `Certificate and profile installer` step, as in some rare cases
Xcode's command line tools crashed with `Trace/BPT trap: 5` if the
environment contained "special" Unicode characters (e.g. if your
name in the profile includes non English characters).

The new solution is that you can now manually specify both or either
parameters for the `Xcode Archive` step directly.

The good news is that **with this you can use new, better ways to handle
the code signing** of your iOS app!

You can of course specify full IDs for both parameters, to achieve the
same effect of the removed `Use force code signing attributes?` option,
but you can now use a more flexible configuration!


### Recommended setup

There's only one thing you have to change in your Xcode project settings:
make sure that the `Provisioning Profile` option is set to `Automatic`,
as described in our [iOS Code Signing Guide on our DevCenter](http://devcenter.bitrise.io/ios/code-signing/).
It's also a good idea to set the `Code Signing Identity` option
to a generic value (e.g. `iPhone Development`) instead of a specific one (like `iPhone Developer: My Name (IDOFIDENTITY)`).

That's all, you should just commit & push this change.

You can now:

1. open your app's Workflow Editor on [bitrise.io](https://www.bitrise.io/)
2. upgrade both the `Certificate and profile installer` and the `Xcode Archive` steps to the latest
   versions (at least `1.5.0` and `1.8.0`, respecively, and `Xcode Analyze` version `1.6.0` if you use that step)
3. select the `Xcode Archive` step
4. and for the new `Force code signing with Identity` input specify either `iPhone Distribution` or `iPhone Development`, depending on
   which type of Certificate/Identity (.p12) you uploaded to [bitrise.io](https://www.bitrise.io/).
   *You can also upload new ones in the Workflow Editor, under the `Code signing & Files` section, if you'd want to.*

That's all. Save the workflow and start a new build.

With this setup you can leave your code signing settings in Xcode set to "iPhone Development",
and you can overwrite that on [bitrise.io](https://www.bitrise.io/) by specifying `iPhone Distribution`
as the value of `Force code signing with Identity`.

> Another advantage of this solution is that setting the `Force code signing with Identity`
> input to a generic category like `iPhone Distribution` solves the
> [CocoaPods frameworks code signing issue](http://devcenter.bitrise.io/ios/frequent-ios-issues/#cocoapods-frameworks-signing-issue),
> where if your main project is set to use Distribution code signing
> the CocoaPods framework projects still require a Development
> signing identity to be present on the system.

You can of course force the use of a specific Identity and/or Provisioning Profile, by
providing the full IDs, but if you keep these values on "automatic" then you can
replace or update your code signing files on [bitrise.io](https://www.bitrise.io/)
any time, without the need to change the values in the Workflow.

### Notes, tips & tricks

**Note about the Provisioning Profile ID**: if you want to set a specific Provisioning Profile ID
you should set it's UUID and not it's title as the parameter - this is noted in the related
input of the `Xcode Archive` step. Basically you have to set the same value what Xcode stores
in Xcode project settings. You can check it by changing the value in Xcode and then
inspecting the changes in e.g. `git`. The Identity is stored as a text (e.g. `iPhone Developer: ...`),
but the Provisioning Profile is stored as a UUID (e.g. `xyz045x4-6143-4e5a-a94a-3fe3aec96eb3`).
You have to specify the value in the same form for the step input, as the value will be passed
to Xcode directly, and it expects it in the form it would be stored in the Xcode project settings files.

> **Tip for debugging**: you can check the log of the `Certificate and profile installer` step,
> that includes the IDs of the files you uploaded to [bitrise.io](https://www.bitrise.io/).
> You can use this to specify the exact ID or the type of the code signing files (`iPhone Development` / `iPhone Distribution`).
> You can also check what value Xcode stores as part of the project settings:
> just change the value in Xcode and then inspect the change in `git`. You'll see
> where and in what form Xcode stores these configuration options.

You also have to specify the Identity in the form it's stored in Xcode project
settings, and not how it's presented in the Xcode.app GUI! This means that
instead of `iOS` (`iOS Distribution/Development`) you have to use `iPhone`
(`iPhone Distribution` or `iPhone Development`). Capitalization also matters,
`iPhone Distribution` works but `iphone distribution` does not!

_If you prefer to use **Xcode Schemes** to manage your code signing settings
you can of course still do that, by creating multiple Schemes in Xcode (just [don't forget to
mark the schemes as shared](http://devcenter.bitrise.io/ios/frequent-ios-issues/#xcode-scheme-not-found)).
Every Xcode step we maintain includes a Scheme input, so you can specify different Schemes
for every Xcode step if you want to, but you can now specify different Code Signing Identities
for the (`Xcode Archive` and `Xcode Analyze` - `Xcode Test` does not require code signing) steps
as an alternative, so that you don't have to maintain multiple Schemes in Xcode._

On our DevCenter you can find more information about
[how you can export & upload your iOS code signing files](http://devcenter.bitrise.io/ios/code-signing/),
about our handy [Code Signing Doctor (`codesigndoc`)](https://github.com/bitrise-tools/codesigndoc) tool,
as well as more advanced tips and guides like _Using multiple code signing file sets_,
to create multiple, differently signed iOS IPAs (e.g. one with an Ad Hoc code signing,
and one with an App Store code signing).

You can find **more in-depth description** about how iOS code signing works,
as well as **tips and tricks to make the process easier and more manageable**
on our [new, completely open source DevCenter](https://bitrise-io.github.io/devcenter/ios/code-signing/).
