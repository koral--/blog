---
title: Weekly VM updates
date: 2016-06-05 09:34 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---


## OS X Stacks: Dependency manager cache updates

As usual, all of the OS X Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
[can be found on GitHub](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

You can find this week's Stack `diff`s on GitHub:

* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/commit/b16a90f81096e4b688a9583146747812a7dadf38) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/commit/2d1aa42b70da3860f39e6cb9c3d4f56c14aadccb) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/commit/95e871e3cb5bd571f66c15a4301e8fe88aca9f45) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

* fastlane : `1.91.0` -> `1.94.0`

Check out
the [diff of this week's update](https://github.com/bitrise-io/bitrise.io/commit/148b7be00ab13989801217c6a87a00f4f7dc4e3c),
and
the [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)
of the Stack.



## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/commit/56a15dabe5a1a18d75b1e375ea1467d2232f6654) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/commit/ed27f574949c542f1f9742035d66e74996f73f96) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/commit/13d7ee2cf7c16b3991a26d21c58be78557f190b4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.
