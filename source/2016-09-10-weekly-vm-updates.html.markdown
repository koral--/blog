---
title: Weekly VM updates
date: 2016-09-10 07:30 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

The most significant change is related to Xamarin Beta and Alpha:
after the datastore migration last week we could finally rebuild
these stacks the same way we did with Xamarin Stable:
all three Xamarin stacks have 200 GB total disk storage (more than 100 GB free)
and are running on MacOS 10.11.6.
_As we did before, the Xamarin version on the Xamarin stacks will be updated every weekend._

Additionally Android build tools `24.0.2` is now pre-installed on
all three Xamarin stacks.

There's only one issue you might experience with the latest
Xamarin Alpha and Beta versions, if you get an error like:

<pre><code>MTOUCH: error MT0091: This version of Xamarin.iOS requires the iOS 10.0 SDK (shipped with Xcode 8.0) when the managed linker is disabled. Either upgrade Xcode, or enable the managed linker.
</code></pre>

in the `Nunit Runner iOS Test` step, for now you should, as the error mentioned, enable the managed linker for your project.

The workaround until we create Xcode 8 based Xamarin stacks (we'll do that
once the final Xcode 8 is released):

1. In Xamarin Studio's project navigator open your iOS project's `Project Options` (by double clicking on the project/rigth click `Options`).
1. Select `iOS Build` in the side menu
1. Set the `Linker behavior` (in the `Code Generation & Runtime` section) to `Link All` or `Link Framwork SDKs Only`


## macOS Stacks

As usual, all of the macOS Stacks received a dependency manager cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

**The only exception is the "Edge" stack, which is re-built every week**,
so it includes the latest-and-greatest versions of the pre-installed tools,
not just dependency manager cache updates.

As everything else we use for
provisioning the macOS VMs, the weekly cache update `Ansible` playbook
[can be found on GitHub](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).

You can find this week's Stack `diff`s on GitHub:

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/6db221179f090c313b1d7ef75eb6f7a4fb05dc0c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/80e9d1b681be5c2ca96faf9c048cf335a06a8bce) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/9b1cf1d90fbe3fa764b8e5a29168fd3bd8df008b) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/9fb2c77dad13ca2c9daf17d70000b3918c34f9ca) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/3d733d5eaa94e52277d9eb4ab537e94961c889c1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/d931e5d40f35dd56962a462c52bf33561a3f69e3) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android "LTS" (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/5e24eb4aa74f1f408959b1e5ec7598cf338c41e1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/d72d73c256eac1502feb1151784a830ba45ad318) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/f425b4bf508987846fde4f081efc0940fce2ee50) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/64/commits/b3431733bb7dde239452db31575fcc526731cca1) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.

**Happy Building!** 🚀
