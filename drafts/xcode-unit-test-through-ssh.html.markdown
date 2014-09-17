---
title: Xcode Unit Test through SSH
tags: osx-dev, ios-dev
authors: Viktor Benei|viktorbenei@bitrise.io
---

Running Xcode's Unit Test in Simulator through SSH can be tricky.

At Bitrise we have the following setup:

* SSH into the host (Virtual Machine) which has Xcode (full Xcode, not just the command line tools!) installed on it.
  * our SSH command looks like this: `$ ssh [ip.address] -p [port] -oUserKnownHostsFile=/dev/null ... -l [user] bash --login -c "the command to execute"`


An important SSH configuration on the host (in our case in the Virtual Machine):
**don't set UsePAM no** in the host's *sshd_config* file!

For some reason if this option is disabled (it's enabled by default) the SSH
user won't get an appropriate user environment to run unit tests in Xcode Simulator.

Instead you should set the *ChallengeResponseAuthentication no* option to disable the password authentication.

Note: *PasswordAuthentication no* is not enough to disable password based authentication!
Either *ChallengeResponseAuthentication* or *UsePAM* should also be disabled!
