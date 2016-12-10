---
title: Virtual machine update this weekend (July 11)
date: 2015-07-06 12:55 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We now have the new virtual machine prepared and it
passed our initial tests so we now have the exact tool
version change list, we expect this to be the complete list of updates.

The pre-installed stable Xcode version will be upgraded
from `6.3.2` to `6.4` and **we'll also start to pre-install Xcode 7 betas**,
this time `Xcode 7 beta2 (build version: 7A121l)`.

You'll be able to select Xcode 7 beta for building
with the *Select Xcode version* step once the new Virtual Machine is
published.

**We'll introduce a new environment variable** as well: `CI=true`.
This is an emerging trend in Continuous Integration / Delivery
services, and helps you to write scripts which do different
things when you run it on your own machine and when it runs
on a CI server/service like [Bitrise](https://www.bitrise.io/){:target="_blank"}.


## Schedule & Status

**Status**: the virtual machine update is now **finished**.
Our tests did finish successfully, we don't know about any issue related to the update.

The Virtual Machine update is scheduled for **Saturday, July 11, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*


