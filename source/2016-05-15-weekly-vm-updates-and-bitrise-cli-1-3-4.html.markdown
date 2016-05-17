---
title: Weekly VM updates and Bitrise CLI 1.3.4
date: 2016-05-15 11:41 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## All Stacks

We updated the [Bitrise CLI tools](https://www.bitrise.io/cli) to the latest versions:

* bitrise: `1.3.4`
* stepman: `0.9.19`

You can read more details about the new CLI version and about this monthly's
CLI tool and Step updates in our previous [Monthly release of May has arrived](/2016/05/11/monthly-release-of-may-has-arrived.html)
blog post
and in the [official CHANGELOG of the Bitrise CLI](https://github.com/bitrise-io/bitrise/blob/master/CHANGELOG.md).

## OS X Stacks: Cache update

As usual, all of the OS X Stacks received a cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

Notable changes (in addition to the CLI version upgrades):

* `bundler` was upgraded to `1.12.3`
* `fastlane` was upgraded to `1.89.0`

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/448d993cdf91f3675553670867d0864f6fe13dcc](https://github.com/bitrise-io/bitrise.io/commit/448d993cdf91f3675553670867d0864f6fe13dcc).

**Note about Ubuntu version**: the current Android/Linux stack is based on Ubuntu 14.04 - we'll soon upgrade this to the latest LTS Ubuntu version (`16.04`),
and we'll upgrade the pre-installed Java version from `Java 7` to `Java 8` ([related GitHub issue](https://github.com/bitrise-docker/android/issues/6)).


## Stack / System Reports

You can find the full `system report` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.
