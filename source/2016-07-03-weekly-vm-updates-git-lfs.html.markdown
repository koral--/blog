---
title: Weekly VM updates - Git & LFS
date: 2016-07-03 12:25 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Summary

This week's main changes are related to `git`. These changes
are now available if you use the `Xcode "Edge"` or `Linux/Android` stacks,
*other stacks were not updated with these changes*.

Both `Xcode "Edge"` and `Linux/Android` stacks are now configured
in a way to make it easy for you to push back into your repository.
We still think that pushing anything back to your repository from an
automation environment is usually not a good idea, as it might lead
to infinite build cycles (where the git push will trigger a new build,
which will trigger a new build, ...), as well as should be considered
really carefully, to make it sure you do not delete files by accident
in an automation environment.

That said, a common workflow for many teams involves pushing git tags
back to the repository, which is now really simple on the updated
stacks - you don't have to configure anything, it just works,
you can run `git push --tags` and it'll work (if you configured your
repository with proper read-write SSH key access).

The second `git` related change is that __[git LFS](https://git-lfs.github.com)__
is now preinstalled and configured on both stacks (`Xcode "Edge"` and `Linux/Android`).
It wasn't an impossible thing to do even before, but you now don't have
to do anything if your repository uses __Git LFS__. It just works (the motto
of this update it seems 😉).


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

* Xcode "Edge": [diff](https://github.com/bitrise-io/bitrise.io/commit/d63368ea5ab3fb359b7166b0d91ec96a0221e545) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-edge.log)
* Xcode 8.0.x: [diff](https://github.com/bitrise-io/bitrise.io/commit/68823dcc40c6034554070a0a2552a58b86d5892c) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-8.0.x.log)
* Xcode 7.3: [diff](https://github.com/bitrise-io/bitrise.io/commit/a76930f6de544d12cdc7f9fce8b2f2d5085b0c46) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.3.log)
* Xcode 7.2: [diff](https://github.com/bitrise-io/bitrise.io/commit/4b0dadf8db14844d3c1be8873032a430f2e9c600) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-7.2.log)
* Xcode 6.4: [diff](https://github.com/bitrise-io/bitrise.io/commit/9884ff6ce151beda2ec9844142e147013501aaf8) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xcode-6.4.log)


## Android / Linux (Docker) Stack

You can find this week's Stack `diff`s on GitHub:

* Ubuntu 16.04: [diff](https://github.com/bitrise-io/bitrise.io/commit/17b755370ea02b998cbddf68bc0bd0213d1b1a77) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log)


## Xamarin Stacks

Xamarin Stacks are based on the OS X stacks, so the dependency manager cache updates are applied
on these stacks too (see the `OS X Stacks: Dependency manager cache updates` section for more detail).

In addition to the dependency manager cache updates Xamarin Stacks are upgraded to the latest
Xamarin Studio versions on every weekend.

You can find this week's Stack `diff`s on GitHub:

* Xamarin Stable: [diff](https://github.com/bitrise-io/bitrise.io/commit/aedc96588eee4f55308b71e3ae23e383ace588ce) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log)
* Xamarin Beta: [diff](https://github.com/bitrise-io/bitrise.io/commit/47a71a8b51c7df745f0984827d512933a44b8d06) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log)
* Xamarin Alpha: [diff](https://github.com/bitrise-io/bitrise.io/commit/2e2fb21d1e382b45bb9208ef80e0886eeaf8743f) / [full system report](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log)


## Stack / System Reports

You can find the full system report of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux and for the OS X stacks.
