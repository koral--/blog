---
title: Xcode 7.3 beta 4 is now available
date: 2016-02-24 12:39 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Xcode 7.3 beta 4 is now available [on the New Stacks](http://blog.bitrise.io/2016/01/20/here-comes-the-new-stack.html).

To select this Stack you just have to **open your app** on [bitrise.io](https://www.bitrise.io),
go to the `Settings` tab, and at the bottom of the Settings tab select the `Xcode 7.3 beta, on OS X 10.11`
stack option, and your next build will start with Xcode 7.3 beta 4.

This new Virtual Machine replaces the previous Xcode 7.3 beta configuration,
so if you've already selected this Xcode 7.3 beta stack for your app
you're automatically using 7.3 beta 4 now.

You can find the Stack's description on our [DevCenter](http://devcenter.bitrise.io/infrastructure/available-stacks/#section-xcode-7-3-beta-on-os-x-10-11), the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3-beta.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3-beta.log),
and the changes since the previous version of the stack at: [https://github.com/bitrise-io/bitrise.io/commit/18a7613b726d2408f4f1448d8544d0ecdb23e6cb](https://github.com/bitrise-io/bitrise.io/commit/18a7613b726d2408f4f1448d8544d0ecdb23e6cb).

**Update**: we updated the VM again, to have `wine` pre-installed,
as freedesktop.org is finally accessible again. Change diff: [https://github.com/bitrise-io/bitrise.io/commit/49415c1b73770c263f3f31737200f732d9c4a012](https://github.com/bitrise-io/bitrise.io/commit/49415c1b73770c263f3f31737200f732d9c4a012).

If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).
