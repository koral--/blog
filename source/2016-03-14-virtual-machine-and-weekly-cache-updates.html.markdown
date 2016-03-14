---
title: Virtual Machine and Weekly Cache updates
date: 2016-03-14 08:05 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

This weekend we could finally prepare everything for Weekly Cache Updates
for the OS X Stack, and re-built the Linux stack to update pre-installed
tools.

*From now on we'll do these updates every weekend.*

## OS X Stacks

The OS X Stacks received a Cache update. As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub: [https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

Right now this updates three important caches:

* Homebrew's cache, for faster `brew update`s.
* CocoaPods' cache, for faster `pod install`s.
* Bitrise CLI's Step cache, for faster "latest step version" detection and handling.

With these VM Cache updates you can expect significant build time improvements,
especially if you use CocoaPods and you don't store the Pods directory in
your repository.

This Ansible playbook will be used every weekend to perform these cache updates,
feel free to add your own cache updates or pre-installed tools,
as described on [GitHub](https://github.com/bitrise-io/osx-box-bootstrap#request-a-tool-to-be-pre-installed).


## Linux / Android Stack (Docker)

We had [some issues preparing the new Docker image](https://github.com/bitrise-io/bitrise.io/issues/32),
but everything's resolved now. In short, the Android NDK image grew so large
that it was no longer possible to build it automatically on Docker Hub,
so we now build it on [bitrise.io](https://www.bitrise.io) instead, and
then push it into the Docker Hub registry.

We'll do additional tool updates on the image, and we'll now build
a new version, and update it on bitrise.io Linux VMs every weekend.

You can find the system report of this week's update
on GitHub: [https://github.com/bitrise-io/bitrise.io/commit/9320e15df9223525641be9e495f99913be94fafa](https://github.com/bitrise-io/bitrise.io/commit/9320e15df9223525641be9e495f99913be94fafa).

A quick summary of changes:

* `Go` updated to `1.6`
* `docker` updated to `1.10.2`
* `docker-compose` updated to `1.6.2`
* `Ubuntu` updated to `14.04.4`
* Pre-installed `Gradle` updated to `2.11` (it's still advised to have a `gradlew` wrapper in your repository, which will make sure that the required `Gradle` version will be downloaded and used for your project, instead of relying on the pre-installed `Gradle` version)
* `extra-android-support` package updated to `23.2.1` to have [the latest AppCompat version](https://github.com/bitrise-io/bitrise.io/issues/32) pre-installed

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.

You can also find the `system reports` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).
