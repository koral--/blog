---
title: Weekly VM updates
date: 2016-12-31 09:21 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Highlights

Pretty much the only thing worth to mention is the latest
Ruby release, `2.4.0`, which broke so many Ruby gems that we
had to decide to not to upgrade to it anywhere.

Unfortunately, due to time constraints, this means
that we could not do a usual full rebuild of the Xcode Edge stack,
it only received the dependency manager cache updates like the other Xcode
stacks. Next week we'll keep an eye on how things progress and will
find a solution - either by upgrading gems to versions which work with
Ruby 2.4.0 on the Edge stack, or by fixing the Ruby version to 2.3.x for a while.

_For the full list of changes please check the `diff` of the stacks below._

_Join this Stack update's discussion on
[discuss.bitrise.io](http://discuss.bitrise.io/t/weekly-virtual-machine-stack-updates-2016-12-30/42)_

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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/bddf7f06e65460e1f590ec7865cb47ab061b7d08) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.2.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/6ad28fb042151b8b9822a550711a0a0a97b3806a) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.2.x.log)
* Xcode 8.1.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/1ea3fcbf77cf119dd3a53e329f2b85976fc99c06) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.1.x.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/3a21b69aa3860085403dd9be38fd89f04edf4034) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/5041a62926c2330e5b91b470c2671c632b420312) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/892ba23abb86b71a723c6d1e0631171eedd153d4) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Android (Ubuntu 16.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/317901d1fbaa698f2b29e92a5ba7480f6ca72f38) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android.log)
* Android LTS (Long Term Support) (Ubuntu 14.04): [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/b949e6534e844d2cf8990363d54e6dfb02aa0f5d) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/linux-docker-android-lts.log)


## Xamarin Stacks

Xamarin Stacks are based on the macOS stacks, so the dependency manager cache updates are applied
on these stacks too (see the `macOS stacks -> Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates, Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend, except the `LTS` (Long Term Support) stacks.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/c81280c732811ef91ff514641f91859e0018e111) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/4ac47fe94af9caaac3fde06e38a54de4281b5d7c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/22316097d9341c17d92a09389fc8549405353c96) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)
* Xamarin Stable LTS (Long Term Support): [diff](https://github.com/bitrise-io/bitrise.io/pull/111/commits/015e3a0b8f82d8a72a6d66fcf4f7ef82a5ee33a0) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable-LTS.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the macOS stacks.

**Happy Building!** 🚀
