---
title: Virtual machine update (with Xcode 7 GM) this weekend (Sep 19)
date: 2015-09-17 16:36 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

We now have the new virtual machine prepared and it
passed our initial tests, so we now have the pre-installed tool
version change list, we expect this to be the complete list of updates.

The most significant change will be the upgrade of
Xcode 7 beta to the new GM version. We'll still refer to this version
as `-beta` and to Xcode 6 as `-stable`, but we'll introduce a new
version selection scheme in the next VM to support more Xcode versions
in the future (we plan to include Xcode 6, 7 and 7.1 beta in the
VM after this one).

**Update**: the pre-installed [bitrise CLI] will also be updated
from `1.0.0` to `1.1.1`.

There are other minor version changes and we also update
OS X from `10.10.4` to `10.10.5`.


## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Sep 19, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

