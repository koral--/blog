---
title: Xcode 7.3 beta 3 is now available
date: 2016-02-10 22:17 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Xcode 7.3 beta 3 is now available [on the New Stacks](http://blog.bitrise.io/2016/01/20/here-comes-the-new-stack.html).

To select this Stack you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Xcode 7.3 beta, on OS X 10.11`
stack option, and your next build will start with Xcode 7.3 beta 3.

This new Virtual Machine replaces the previous Xcode 7.3 beta configuration,
so if you've already selected this Xcode 7.3 beta stack for your app
you're automatically using 7.3 beta 3 now.

You can find the Stack's description on our [DevCenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-xcode-7-3-beta-on-os-x-10-11), the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3-beta.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3-beta.log),
and the changes since the beta 2 stack at: [https://github.com/bitrise-io/bitrise.io/commit/df71885925b5d1a232fe1df302826df08cff1ba5](https://github.com/bitrise-io/bitrise.io/commit/df71885925b5d1a232fe1df302826df08cff1ba5).

This new configuration has `wine` pre-installed,
which was [contributed by @KevinMartin](https://github.com/bitrise-io/osx-box-bootstrap/pull/5)
(we're still working on the Stack Pull Request checks 😉).

If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).
