---
title: Weekly VM updates - Bitrise CLI 1.3.5
date: 2016-06-11 13:34 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Common

As usual a new [Bitrise CLI](https://github.com/bitrise-io/bitrise)
version was published on the second Tuesday of the month (this Tuesday),
and as there was no show-stopper issue we updated the VMs this weekend to use the latest Bitrise CLI
version: `1.3.5`.

You can read more about the new CLI version in our previous blog post:
[Monthly release of Bitrise CLI (June)](/2016/06/08/monthly-release-of-bitrise-cli-june.html).

Other than this there was no significant update on the VMs this week, except on the Xamarin stacks
where new versions of Xamarin Stable & Beta were released, so the Xamarin VM images were updated
to use the latest Xamarin versions.


## OS X Stacks: Dependency manager cache updates

As usual, all of the OS X Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
[can be found on GitHub](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

You can find this week's Stack `diff`s on GitHub:

* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/commit/c63a863b368322038370fa3859b2e6edb823a68a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/commit/5262d683a859b902d125a9392ce620635d1720d6) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/commit/2241d76dd1e33dcb38a78f393f211817c6281de2) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/commit/f7168cc6afb611443e30577991180b8ec79ed046) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/commit/7a7078447c87bc43d27eb773f502eccd89d3ad54) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/commit/1ac24a307f34bdbcc66e9834195351ebf756c650) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/commit/62ecc07f30415f18f6db1999887746a9c39eb863) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.
