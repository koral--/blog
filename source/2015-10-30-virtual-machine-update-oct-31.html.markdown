---
title: Virtual Machine update - Oct 31
date: 2015-10-30 12:10 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

We got quite a lot of requests about when the new VM would be available
with `Xcode 7.1` (final), and why we hadn't published our VM update schedule yet.

We had a couple of issues with preparing the new VM, related to the new Xcode
version. We prepared the first version on Monday as we usually do, but then
it started to fail our tests.

What went wrong?

Two things:

1. Xcode 7.1 registers its iOS Simulators in a different way, than previous Xcodes did (7.1 beta was working fine), and we failed to find a solution to make it work with Xcode 6.4 installed iOS Simulators. The issue is that once the Xcode 7.1 iOS Simulators are installed, Xcode 6.4 conflicts with these Simulators and will automatically try to create new Simulators, which results in a lot of duplicated Simulator versions. In practice it means that it's impossible to run Xcode Tests with just specifying the Simulator type, the only way would be to specify the whole ID of the Simulator. We'll try to find a solution next week, and we had to go with not installing additional iOS Simulators this week, only the default ones.
    * _Note_: the `Select Xcode Version` step lists all the available Simulators after it activates the specified Xcode version.
2. Xcode 7.1 has a known issue with RVM installed Ruby if you want to use the new, recommended `-exportOptionsPlist` parameter. Although we could (and we did) fix this with a workaround in the Xcode Archive step, RVM could still conflict with other tools (like `fastlane`) which doesn't have a built in fix or workaround for this issue. To provide a better environment for your builds we decided to remove RVM and to use a `brew` installed `ruby` version by default. You can of course still install RVM if you want to, but this change should provide better compatibility for other tools in general.

To summarize this week's changes:

* There will be two Xcode versions pre-installed: `Xcode 6.4` and `Xcode 7.1` (final).
* We could not install additional iOS Simulators, as described above, so for `Xcode 6.4` the only available Simulator is `8.4` and for `Xcode 7.1` it's `9.1` - we'll try to include all the available simulators (just like we did before) in next week's VM update.
* `RVM` removed, replaced with a `brew` installed default `Ruby`
* __new pre-installed tools__ : `fastlane` and `xcpretty`


## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Oct 31, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*
