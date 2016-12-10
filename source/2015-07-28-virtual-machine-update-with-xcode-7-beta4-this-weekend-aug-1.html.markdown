---
title: Virtual machine update (with Xcode 7 beta4) this weekend (Aug 1)
date: 2015-07-28 17:10 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

We now have the new virtual machine prepared and it
passed our initial tests so we now have the exact tool
version change list, we expect this to be the complete list of updates.

Notable changes:

* Xcode 7 beta 4 will replace beta 3
* Our old workaround daemon for Xcode Simulator access ([https://github.com/bitrise-io/xcodebuild-unittest-miniserver](https://github.com/bitrise-io/xcodebuild-unittest-miniserver)) will be removed. **Make sure you upgrade to the latest Xcode Test step** as previous versions use this workaround!
    * You can find more information on this tool's GitHub page why it was required, and we're now replacing it with our new, more flexible version which was integrated into Bitrise a couple of months ago: [https://github.com/bitrise-io/cmd-bridge](https://github.com/bitrise-io/cmd-bridge)


## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Aug 1, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

