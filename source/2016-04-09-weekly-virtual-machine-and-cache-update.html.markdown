---
title: Weekly Virtual Machine and Cache update
date: 2016-04-09 12:13 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## OS X Stacks: Cache update

All of the OS X Stacks received a regular Cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

From now on [fastlane](https://github.com/fastlane/fastlane) is pre-installed on the Android
stack too! `fastlane` for Android just graduated from "beta" this week,
and [@jvanderwee](https://github.com/jvanderwee) was amazingly quick
to [send us a Pull Request with the required bits](https://github.com/bitrise-docker/android/pull/9)
to install & check `fastlane` on the Android Docker image!

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/85b9badd1208995f0a1865510653c5ed5d3c6d1a](https://github.com/bitrise-io/bitrise.io/commit/85b9badd1208995f0a1865510653c5ed5d3c6d1a).


## Stack / System Reports

You can find the full `system report` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.
