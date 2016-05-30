---
title: Weekly VM updates - Ubuntu 16.04 with Java 8
date: 2016-05-30 14:08 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlight

This weekend we could finally upgrade the Linux stack to the **latest Ubuntu LTS version**,
from the previous `14.04` to the new `16.04`.

**We also upgraded the pre-installed Java version on the Linux stack** from Java 7 to Java 8,
as well as we could finally use official `apt` repositories for tools like `Maven`
where we previously had to use PPAs.

The OS X stacks received the usual dependency manager cache updates, and the Xamarin stacks
were upgraded to the latest Xamarin Studio.


## OS X Stacks: Dependency manager cache updates

As usual, all of the OS X Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).



## Android / Linux (Docker) Stack

Change Highlights:

* **Ubuntu**: `Ubuntu 14.04.4 LTS` (trusty) -> `Ubuntu 16.04 LTS` (xenial)
  * kernel: `3.19.0-33-generic` -> `4.4.0-22-generic`
* Ruby : `2.2.4` -> `2.2.5`
* `bundler` : `1.12.4` -> `1.12.5`
* `git` : `1.9.1` -> `2.7.4`
* Python : `2.7.6` -> `2.7.11+`
* mercurial : `2.8.2` -> `3.7.3`
* `curl` : `7.35.0` -> `7.47.0`
* `wget` : `1.15` -> `1.17.1`
* `docker` : `1.10.3` -> `1.11.1`
* `docker-compose` : `1.6.2` -> `1.7.1`
* Gradle : downgrade from `Gradle 2.13` (installed from a PPA) to `Gradle 2.10` (installed from official `apt` repository)
  * This should not cause any issue, if you have `gradlew` in your repository this change doesn't affect you at all, otherwise you should configure `gradlew`,
    as that's the official way to lock the Gradle version you want to use. If you have `gradlew` configured in your repository the official Bitrise Gradle
    steps will use that, instead of the system pre-installed Gradle - if you have [$GRADLEW_PATH](https://github.com/bitrise-io/steps-gradle-runner/blob/master/step.yml#L49)
    configured, which is configured automatically during the Add New App setup process.
    If not, just set it to the path of your `gradlew` file, relative to your repository's root (e.g. `./gradlew` or `./sub/dir/gradlew`),
    in the App Env Vars section.
* Maven : no version change (`3.3.9`), but install from official `apt` repository instead of from a PPA
* fastlane : `1.89.0` -> `1.91.0`
* Java : `javac 1.7.0_101` -> `javac 1.8.0_91`

Check out the [diff of this week's update](https://github.com/bitrise-io/bitrise.io/compare/8ac0bc105314d2120d073d7054b4a1cd86e97cf6...master#diff-279d8e63a452a95460c7a1d053842567),
and the [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log) of the Stack.



## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see: `OS X Stacks: Cache update` for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/commit/a32f95e45694aece503b2bd92f360c4ce427c746) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/commit/61c35c6c8b2539379006be153ea18787fc429d03) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/commit/228aa305c503eba1fbbe1a6a74ea80ada7d92bc4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full `system report` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.