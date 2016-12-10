---
title: Virtual machine update (with Xcode 7 beta 6) this weekend (Sep 5)
date: 2015-09-01 18:49 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine update is now **finished**.

We now have the new virtual machine prepared and it
passed our initial tests, so we now have the pre-installed tool
version change list, we expect this to be the complete list of updates.

List of upgraded pre-installed tools:

* installed with Homebrew:
    * __git__: `2.5.0` -> `2.5.1`
    * __xctool__: `0.2.4` -> `0.2.5`
    * __go__: `1.4.2` -> `1.5`
* __Xcode__:
    * __-beta__: `7.0 beta 5 (build version: 7A176x)` -> `7.0 beta 6 (build version: 7A192o)`

There are two new "mysterious" additions as well - the final pre-installed version
might change if we have to release patches while we're testing the new VM:

* [bitrise CLI](https://github.com/bitrise-io/bitrise){:target="_blank"}: **new**, `0.9.11`
* [bitrise-bridge](https://github.com/bitrise-io/bitrise-bridge){:target="_blank"}: **new**, `0.9.2`
* [cmd-bridge](https://github.com/bitrise-io/cmd-bridge){:target="_blank"}: `v0.9.2` -> `0.9.3`

*Update: we had to patch `bitrise-bridge` and `cmd-bridge`, versions changed.*

We'll share more information about these new tools at the end of the weekend 😉


## Schedule & Status

**Status**: the virtual machine update is now **finished**.

The Virtual Machine update is scheduled for **Saturday, Sep 5, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*


