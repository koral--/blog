---
title: Weekly VM updates
date: 2016-06-18 12:56 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## OS X Stacks

As usual, all of the OS X Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

**The only exception is the "Edge" stack, which is re-built every week**,
so it includes the latest-and-greatest versions of the pre-installed tools,
not just dependency manager cache updates.

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
[can be found on GitHub](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

You can find this week's Stack `diff`s on GitHub:

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/commit/dfe5f45ea543fec52ad14b123f93daaa3221c632) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/commit/368c905e4ba226ca2722001863046101b30b87b4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/commit/8a7c0a52d77d7a29deb63f50d387204422ab3aec) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/commit/fbec59e05d5041af86b8fe9e2f5bbb319d94c803) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/commit/16853473e23189b3c990d16aa2a6d6b7ff05d775) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

Android 24 is no longer "preview" - this week's update includes
the new v24 packages, instead of the preview ones!

Additionally, thanks to [@ThorstenBux](https://github.com/bitrise-docker/android-ndk/pull/2),
Android NDK was also upgraded, to v12!

Ruby was also upgraded to `2.3.1` on this Stack.

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/commit/b8d88b20be3d9098634b76a27cb150336ca5935d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/commit/ea21a62a7d9f3ecd69d515181bc631fad6585146) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/commit/9ef5f85c5077e89624d95c8ff15c9b84f8477d31) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/commit/c92b214e3c20b9aba10ef02841158a3dbea8ec85) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.
