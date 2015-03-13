---
title: New Virtual Machine now live, includes Xcode 6.3b2
date: 2015-03-07 08:23 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

The new Virtual Machines are now live and available
for everyone and it contains two Xcode versions:

* The latest stable version of Xcode 6.1.1
* The latest beta version of Xcode: 6.3 beta 2

You can select the Xcode versions by specifying
the *channel* id in the Xcode build Steps,
or if you want to activate an Xcode version for your
whole Workflow, even before the first Xcode build Step
would run you can add a *Bash Script* Step to your Workflow
with the content:

    #!/bin/bash
    set -e
    XCODE_CHANNEL_ID="-stable"
    sudo xcode-select --switch "/Applications/Xcodes/Xcode${XCODE_CHANNEL_ID}.app"

*We'll release a new Step soon to make the management of Xcode versions
easier for you.*

There are two available Xcode channels in the current virtual machines:

* `-stable` : This is the default selected Xcode, will be used if you don't specify another channel.
* `-beta` : If you want to use this channel you have to activate it in your Workflow as described above.

An important note for those who used the previous Xcode version selection: you'll have to migrate your Xcode selection to the new *channel* based selection as the old method (where you had to specify the major number of Xcode, not the *channel*) is now not supported.

We'll definitely work on improving how you can select the Xcode version you
want to use, in the meantime feel free to ask or suggest anything related to
the new virtual machine update schedule or Xcode version support!


