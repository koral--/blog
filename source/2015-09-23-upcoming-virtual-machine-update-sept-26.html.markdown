---
title: Upcoming Virtual Machine update - Sept 26
date: 2015-09-23 19:36 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

*We now have the new virtual machine prepared and it
passed our initial tests, so we now have the pre-installed tool
version change list, we expect this to be the complete list of updates.*

This Virtual Machine update will bring a significant change: this
will be the first version with three Xcode versions installed.
Namely: Xcode 7.0 (final), Xcode 7.1 (beta 1) and Xcode 6 (for those who
need it for compatibility reasons).

This change means that we had to adapt the `Select Xcode Version` step
to be able to select the Xcode version you want to use.

The [Pull Request is ready](https://github.com/bitrise-io/steps-select-xcode-version/pull/3/files#diff-91d8d269a1c9bd3631ddb04b80b01c4eR54){:target="_blank"}, it'll be merged and a new version
of the Step will be published when we start to roll out the new VM on
Saturday. Older versions of the step will still work, but in order to select
Xcode 6 you'll have to upgrade this Step!

**Xcode 7.0 will also replace Xcode 6 as the `-stable` option of the step.**
This is the full version mapping list:

* __xcode-7__ / __-stable__: `7.0 (build version: 7A220)`
* __xcode-7-beta__ / __-beta__ / __-latest__: `7.1 beta 1 (build version: 7B60)`
* __xcode-6__: `6.4 (build version: 6E35b)`



## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Sept 26, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

