---
title: Virtual machine update this weekend (June 13)
date: 2015-06-11 14:15 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We now have the new virtual machine prepared and it
passed our initial tests so we now have the exact tool
version change list, we expect this to be the complete list of updates.

We're preparing to support the awesome new Xcode 7 announced on WWDC
and still waiting for Xcode 6.4 which is in Beta for quite some time now.

We actually anticipated that Xcode 6.4 will be out of beta by now,
but (probably because of the work on Xcode 7) it's still just a beta
so we finally decided to do a minor Xcode upgrade instead:
from Xcode `6.3.1` to `6.3.2`.

There were other minor pre-installed tool upgrades
and we now pre-install one more tool (actually a collection of tools): `coreutils`.

Coreutils contains handy utility tools like `(g)timeout`
which can be used to run `bash` commands easily with a maximum
allowed execution time.

*Note: Coreutils is installed with [Homebrew](http://brew.sh/){:target="_blank"} which means
that all the tools are prefixed with the letter `g`.
For example `timeout` is available as `gtimeout`.*


## Schedule & Status

**Status**: the virtual machine update is now **finished**.
Our tests did finish successfully, we don't know about any issue related to the update.

The Virtual Machine update is scheduled for **Saturday, June 13, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

