---
title: Weekly Virtual Machine and Cache update
date: 2016-04-16 18:54 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## All Stacks

We updated the [Bitrise CLI tools](https://www.bitrise.io/cli)
to the latest versions:

* bitrise: `1.3.0`
* stepman: `0.9.18`
* envman: `1.1.0`


This should not affect your builds, except in one case, if you use environment
variables set to an empty value. Previously an environment variable set to
an empty value was simply ignored, in Bitrise CLI `1.3.0` (and in the latest
`envman` version) the empty value won't be skipped anymore. This was an
important change to let you "unset" environment variables.

You can read more details about the new CLI version and about the new, monthly
release cycle of the CLI tools in our previous
blog post [New version of the Bitrise CLI (1.3.0) is finally released!](/2016/04/13/new-version-of-the-bitrise-cli-1-3-0-is-finally-released.html)
and in the [official CHANGELOG of the Bitrise CLI](https://github.com/bitrise-io/bitrise/blob/master/CHANGELOG.md).

## OS X Stacks: Cache update

A notable change / improvement: the `CocoaPods Install` step was
updated to optimize install times (*you can upgrade the Step in to the latest
version in the [Workflow Editor on Bitrise.io](http://devcenter.bitrise.io/getting-started/manage-your-bitrise-workflow/)*).
The step will now first try to
run `pod install` with the `--no-repo-update` flag ([thanks @scosman for the tip!](https://github.com/bitrise-io/steps-cocoapods-install/issues/5)), and it'll retry
the install *without* the flag if required. This should help
to improve the speed and reliability of installing Pod dependencies -
you can find more detail about why this was required & the GitHub
rate limiting applied on the CocoaPods main spec repository [on GitHub](https://github.com/CocoaPods/CocoaPods/issues/4989).

As usual, all of the OS X Stacks received a cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

Notable changes (in addition to the CLI version upgrades):

* `Go` was upgraded to `1.6.1` from `1.6.0`
* `zip` is now pre-installed, in addition to `unzip`
* the Docker image now has a designated Cache location, exposed in the Environment Variable: `$BITRISE_CACHE_DIR`
  * note: the latest Bitrise CLI automatically creates a "cache" directory
    and exposes it in the `$BITRISE_CACHE_DIR` environment variable if
    required (if `$BITRISE_CACHE_DIR` is not defined when the CLI starts).
    This change, to prepare the cache directory in the Docker image, is
    useful mainly for those who use Docker directly during the build,
    e.g. to build images, as the cache is located in the shared `/bitrise`
    directory, while the CLI would create it in the *system temp* (`/tmp`)
    directory.

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/5dbe2c58efe6db99dbbf80b978c66d9dde0fa1cd](https://github.com/bitrise-io/bitrise.io/commit/5dbe2c58efe6db99dbbf80b978c66d9dde0fa1cd).


## Stack / System Reports

You can find the full `system report` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.
