---
title: Linux/Android and Weekly Cache updates
date: 2016-03-19 18:11 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

This is a summary of this week's Linux/Android VM update
and of the OS X stack cache update.


## Linux / Android Stack (Docker)

All (three) [official Bitrise Docker images](https://hub.docker.com/u/bitriseio/) were re-built,
and we fixed an issue related to [accepting Android package licenses](https://github.com/bitrise-steplib/steps-start-android-emulator/issues/19#issuecomment-197804553),
which (silently!) prevented a couple of packages to properly install in
the last Docker image version.

You can find the system report of this week's update
on GitHub: [https://github.com/bitrise-io/bitrise.io/commit/91cd09c2351a18493e81be98f8e15dd220411335](https://github.com/bitrise-io/bitrise.io/commit/91cd09c2351a18493e81be98f8e15dd220411335).

A quick summary of changes:

* Pre-installed `Gradle` updated to `2.12` (it's still advised to have a `gradlew` wrapper in your repository, which will make sure that the required `Gradle` version will be downloaded and used for your project, instead of relying on the pre-installed `Gradle` version)
* The `24.0.0-preview` and `android-N` Android packages are now pre-installed
* The system report & check script for the Android image now explicitly checks for
  the presence of [adb](https://github.com/bitrise-docker/android/blob/master/system_report.sh#L32)
  which should be included in the `$PATH`, as well as for the [platform-tools](https://github.com/bitrise-docker/android/blob/master/system_report.sh#L46) package.

You can find the full System Report of the stack on GitHub: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.


## OS X Stacks

The OS X Stacks received a Cache update. As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub: [https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

**The cache update does not upgrade any pre-installed tool
on the given Stack, it only updates specific tool caches
for faster builds.**

Right now this "Cache Update" refreshes three important caches:

* Homebrew's cache, for faster `brew update`s.
* CocoaPods' cache, for faster `pod install`s.
* Bitrise CLI's Step cache, for faster "latest step version" detection and handling.

With these VM Cache updates you can expect significant build time improvements,
especially if you use `CocoaPods` and you don't store the `Pods` directory in
your repository.

This `Ansible` playbook will be used every weekend to perform these cache updates,
feel free to add your own cache updates or pre-installed tools,
as described on [GitHub](https://github.com/bitrise-io/osx-box-bootstrap#request-a-tool-to-be-pre-installed).


## Stack System Reports

You can also find the `system reports` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).
