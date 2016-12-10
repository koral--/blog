---
title: Virtual machine update this weekend (May 2)
date: 2015-04-29 11:40 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We now have the new virtual machine prepared and it
passed our initial tests so we now have the exact tool
version change list, we expect this to be the complete list of updates.

**Xcode will be upgraded** from 6.3 to the latest stable 6.3.1 version.

We'll introduce a [new core tool](https://github.com/bitrise-io/cmd-bridge){:target="_blank"} installed
in the virtual machine. This tool is meant to provide a reliable workaround
to connect to the iOS Simulator from any script.

Previously we used another tool we developed to solve this issue, but
to use that the Step had to interact with it directly.
Once the new virtual machine will be available, with the new *cmd-bridge* tool preinstalled,
you can run your scripts and Steps just like you would on your own machine,
no special code will be required (every step and script will automatically
go through this new workaround process). You can read more about
the issue (connecting to the iOS Simulator from a script, through an SSH session) on
the [GitHub page of the previous tool](https://github.com/bitrise-io/xcodebuild-unittest-miniserver){:target="_blank"}.


## Schedule & Status

**Status**: the virtual machine update is now **finished**.
Everything seems to be working correctly, we don't know
about any issue caused by this update.

The Virtual Machine update is scheduled for **Saturday, May 2, 2015**,
we'll update this section with the status of the update.

*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*


## Planned changes

* git: 2.3.5 -> 2.3.6
* Xcode:
  * -stable: 6.3 -> 6.3.1 (6D1002)
  * -beta: no beta Xcode installed
* Rubies installed with RVM
  * 2.1.6
  * 2.2.2
  * 2.1.5 (p273), set as default
  * [CocoaPods](http://cocoapods.org/){:target="_blank"}: 0.36.3 - pre-installed for the default Ruby version -> 0.36.4
  * bundler installed for the default Ruby version
* [cmd-bridge](https://github.com/bitrise-io/cmd-bridge){:target="_blank"}: **new**, v0.9.2 installed and auto-started in server mode (with LaunchAgent)
