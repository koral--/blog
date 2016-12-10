---
title: Xcode 7.3.1 - Stack Update
date: 2016-05-05 09:52 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Xcode 7.3.1 is now available!

**This new Virtual Machine replaces the previous Xcode 7.3 configuration,
so if you already selected the Xcode 7.3 stack for your app,
you're automatically using 7.3.1 now.**

If you're not on the 7.3 stack yet and you want to switch:
to select this Stack you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Xcode 7.3.1, on OS X 10.11`
stack option, and your next build will start on the Xcode 7.3.1 stack.

You can find the Stack's description on our [DevCenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-xcode-7-3-on-os-x-10-11),
the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log),
and the full system report `diff` between 7.3 and 7.3.1 at: [https://github.com/bitrise-io/bitrise.io/commit/f2b580ecb99ac259d1da1605dc7e578640866193](https://github.com/bitrise-io/bitrise.io/commit/f2b580ecb99ac259d1da1605dc7e578640866193).

Pre-installed tool version change highlights:

* Xcode: `7.3 (7D175)` -> `7.3.1 (7D1014)`
* fastlane: `1.67.0` -> `1.84.0`
* Node.js: `v5.9.0` -> `v6.0.0`
* NPM: `3.7.3` -> `3.8.6`
* carthage: `0.15.2` -> `0.16.2`
* xctool: `0.2.8` -> `0.2.9`
* bundler: `1.11.2` -> `1.12.1`
* Go: `1.6.1` -> `1.6.2`
* git: `2.7.4` -> `2.8.2`

**Stack change / long term support note:**
the 7.3 Stack is *not yet a Long Term Support stack*! This means that when a new patch release
version is available for Xcode 7.3 (in this case 7.3.1) we upgrade this Stack
and the previous version of it is no longer available.
The latest Long Term Support (LTS) OS X Stack right now is
the [Xcode 7.2](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-xcode-7-2-on-os-x-10-11) stack.
The 7.3 Stack will be available as a Long Term Support stack once there are no more updates for Xcode 7.3.

*You can find more information about the Stack support
types [on our DevCenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-stack-status-types).*



If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).
