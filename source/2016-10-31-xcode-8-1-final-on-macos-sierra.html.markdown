---
title: Xcode 8.1 (final), on macOS Sierra
date: 2016-10-31 11:33 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Xcode 8.1 (final) is now available, and it's installed
on macOS Sierra (10.12.1)! 🎉

__Notes__: Sierra changed a few things, especially for keychain management,
so if you want to use the new Xcode 8.1 stack you'll have to upgrade the
`Certificate and profile installer` step to the latest version.
Otherwise your build will __"hang"__ when Xcode tries to sign your code,
due to a permission popup, where you should manually click "Allow".
The latest `Certificate and profile installer` step
has a fix for this, enabling the installed certificates to be used
without manual intervention. _This might affect other tools as well unless they were upgraded
to handle the change Sierra brought!_

Unfortunately __`xctool` had to be removed from the Xcode 8.1 stack__,
as it seems it's not (yet) compatible with macOS Sierra,
at least not how `brew` installs it. Of course you can install `xctool`
yourself if you want to, just like [any other tool which is not preinstalled](https://bitrise-io.github.io/devcenter/tips-and-tricks/install-additional-tools/).


__To select this Stack__ you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Xcode 8.1.x`
stack option, and your next build will start on the Xcode 8.1 stack.

This new Virtual Machine replaced the previous Xcode 8.1 (GM) configuration,
so __if you've already selected the Xcode 8.1.x stack for your app, you're automatically using Xcode 8.1 (final) now__.

__You can find the Stack's__ full __system report__ at:
[https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log),
and the changes/updates at:
[https://github.com/bitrise-io/bitrise.io/commit/0a3a7e82f568e397c56b8248e872f39a3ca99a7e](https://github.com/bitrise-io/bitrise.io/commit/0a3a7e82f568e397c56b8248e872f39a3ca99a7e).

If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).

**Happy Building!** 🚀
