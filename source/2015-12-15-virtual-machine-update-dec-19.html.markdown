---
title: OS X Virtual Machine update - Dec 19
date: 2015-12-15 15:52 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> **Status**: the virtual machine is prepared, passed our tests and ready for distribution.

If everything goes as planned this OS X Virtual Machine update
will be the last where we include multiple Xcode versions in the
same Virtual Machine. We're preparing our new OS X infrastructure
where Xcode versions will be installed into separate VMs.

This'll also help to provide a more stable environment, as once
a VM with a specific Xcode version will be released we won't update it,
so your builds will run in the exact same environment as long as you
use the same Xcode version.

We also plan to switch to OS X El Capitan with the new VMs,
which will help you to test your OS X apps on bitrise.io (UI tests
are only available on El Capitan for OS X apps).

Here are the more significant pre-installed tool version changes,
which will be available after this weekend's OS X Virtual Machine update:

* There'll be only two Xcode versions: `6.4` and `7.2` (stable)
* `fastlane` upgraded from `1.39.0` to `1.47.0`
* __NodeJS__ upgraded from `v5.0.0` to `v5.2.0`
* __NPM__ upgraded from `3.3.9` to `3.3.12`
* and [bundler](http://bundler.io/) from `1.10.6` to `1.11.0`


## Schedule & Status

**Status**: the virtual machine is prepared, passed our tests and ready for distribution.

The Virtual Machine update is scheduled for **Saturday, Dec 19, 2015**.
We'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*
