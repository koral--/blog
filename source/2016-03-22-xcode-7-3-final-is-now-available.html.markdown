---
title: Xcode 7.3 (final) is now available
date: 2016-03-22 19:32 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Xcode 7.3 (non beta) was finally released by Apple, and you can now
use it on [bitrise.io](https://www.bitrise.io) too!

The Xcode 7.3 stack replaced the previous "Xcode 7.3 beta" stack,
if you used the beta stack you're automatically moved to the non beta 7.3 stack.

If your app is not on the 7.3 stack yet and you want to change it,
you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Xcode 7.3, on OS X 10.11`
stack option. Your next build will start with `Xcode 7.3`!

You can find the Stack's description on our [DevCenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-xcode-7-3-on-os-x-10-11) and the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log).

**Notable changes compared to the Xcode 7.2 stack**:

* `OS X` upgraded to `10.11.4`
* `Go` upgraded to `1.6`
* `Java` is now pre-installed
* `xctool` upgraded to `0.2.8`
* `carthage` upgraded to `0.15.2`
* `wine` is pre-installed
* `fastlane` upgraded to `1.67.0`

*You can find the full diff against the 7.2 stack's system report at: [https://gist.github.com/viktorbenei/08bbe5c4278e33b8cc05](https://gist.github.com/viktorbenei/08bbe5c4278e33b8cc05).*

*Also worth to note*: the `Xcode 7.2` stack is now marked as `LTE` (Long Term Support), which means
that if you need a really reliable environment, where only caches are updated but the
pre-installed tool versions are always the same / won't be updated, you can
use the `Xcode 7.2` option in addition to our first LTE option, the `Xcode 6.4` stack.

If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).
