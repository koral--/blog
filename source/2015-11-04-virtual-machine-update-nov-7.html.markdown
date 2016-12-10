---
title: Virtual Machine update - Nov 7
date: 2015-11-04 15:53 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

We found a solution to have both Xcode 6 & 7 installed on the same OS X machine
and install all of their iOS Simulators as well, so this week
older iOS Simulators will be available again.

**If you use `Xcode 7` you don't have to do anything, it'll just work
as it did before.**

If you use `Xcode 6` you'll have to do two things:

1. You'll have to upgrade to the latest `Select Xcode Version` step version (`2.3.0`). The new version includes a script which can find and delete duplicated iOS Simulator entries, which are generated when you switch to Xcode 6's Command Line Tools.
2. If you want to run tests in iOS Simulator you should specify the OS version, instead of leaving it on `latest`. `Xcode 6`, for some reason, detects the `iOS 9.0` simulator (which is installed from Xcode 7) and it'll try to use that if you specify `latest` for the OS option. The problem is that the `iOS 9.0` simulator can't work with `Xcode 6`, only with `Xcode 7`. To fix this you should just manually set the OS version to `8.4`, which was the latest available iOS Simulator for `Xcode 6`.

To summarize this week's changes:

* There will be three Xcode versions pre-installed: `Xcode 7.1`, `Xcode 7.2 beta` and `Xcode 6.4`.
* `fastlane` and the `bitrise CLI` were updated to the latest available versions.


## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Nov 7, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

