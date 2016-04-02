---
title: Weekly Virtual Machine and Cache update
date: 2016-04-02 13:49 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## OS X Stacks

All of the OS X Stacks received a regular Cache (`brew`, `cocoapods` and `bitrise CLI`) update.
As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

The only notable change this week is that Android `build-tools` version `23.0.3`
is now pre-installed ([thanks @selcukbulca for the PR!](https://github.com/bitrise-docker/android/pull/8)).

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/9cc0cf013645e41b8b273a211526bba9e7a42f67](https://github.com/bitrise-io/bitrise.io/commit/9cc0cf013645e41b8b273a211526bba9e7a42f67).

If you want to see the full System Report (not just the diff) of the stack,
you can find it on GitHub at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log).


## Stack / System Reports

You can find the `system reports` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.
