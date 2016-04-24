---
title: Weekly VM updates and Bitrise CLI 1.3.2
date: 2016-04-24 13:06 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## All Stacks

We could finally update the [Bitrise CLI tools](https://www.bitrise.io/cli)
to the latest versions:

* bitrise: `1.3.2`
* bitrise-bridge: `0.9.8`

We did update the tools to `bitrise CLI 1.3.0` [last weekend](/2016/04/16/weekly-virtual-machine-and-cache-update.html),
but [we had to roll back the changes](http://blog.bitrise.io/2016/04/18/bitrise-cli-1-3-0-issue-fix-is-coming-asap.html)
after we discovered a critical issue in `1.3.0`.

What went wrong?

Although all of the unit tests passed for CLI 1.3.0 and we tested it manually
for about a week, we missed one important thing: the exit code of the CLI.

If you use the CLI manually you probably won't notice the exit code at all.
The CLI prints a summary of the build at the end and you can see whether the build
failed, and which steps did fail. This is properly tested and it did work correctly
in `1.3.0`.

The exit code is not relevant when you use the CLI manually, but it is
really important when you use it through another tool - which is how it's
integrated with the [bitrise.io](https://www.bitrise.io) stack. The build
is marked as successful if the CLI returns with exit code 0, and it's marked
as failed otherwise. So, although the logs were correct and you could see
that the build failed in the logs on [bitrise.io](https://www.bitrise.io),
the Build wasn't marked as failed on the [bitrise.io](https://www.bitrise.io) UI.
Failed build emails were not sent either.

Of course we rolled back the change as soon as we noticed it, and worked
to fix the issue. We did miss one more exit code issue in `1.3.1`,
and fixed it in `1.3.2` (`1.3.1` was only deployed to [bitrise.io](https://www.bitrise.io)
for about 5 minutes).

**What did we miss and how do we ensure that this won't happen again?**
We do have unit tests for the CLI, but we didn't have integration/smoke test
for it. We do have it now, and it works like this: once the unit tests
pass, a "release binary" is created from that specific commit's code,
and then we run a couple of special "builds" with the release binary.
It includes tests for various build types (success, failed,
only a "skippable" step fails, build runs with `bitrise run`,
build runs with `bitrise trigger`, ...), and we now have tests
for the exit codes for every test case.

We also made it sure that we can roll back a virtual machine update
which is deemed "faulty" even faster than before.

Another important thing we're working towards is the plugin system
introduced in `1.3.0`. Our goal is to have a stable CLI core, which
is only responsible for running the builds, and every other feature
should be built as a plugin. When a build runs on [bitrise.io](https://www.bitrise.io)
it will only use the CLI core. Once we can move every feature
into plugins we won't have to modify the core, unless it affects how
builds run (e.g. when introducing a new build configuration option).
This will result in fewer / less frequent changes in the CLI core,
as most of the development will be done in plugins.

We're terribly sorry for the inconvenience the `1.3.0` issue
might have caused for you, we did everything we can to prevent
this to happen in the future.

Part of the new CLI release cycle is that we release the new
version on the second Tuesday of every month, and we only update
the CLI on the [bitrise.io](https://www.bitrise.io) virtual machines after ~4 days (on the weekends).
This means that you can test the new CLI and send us feedback,
as well as you can prepare for any change we introduce in the new version
(although we always try to keep everything compatible with the previous version,
sometimes breaking changes are unevitable).

You can read more details about the new CLI version and about the new, monthly
release cycle of the CLI tools in our previous
blog post [New version of the Bitrise CLI (1.3.0) is finally released!](/2016/04/13/new-version-of-the-bitrise-cli-1-3-0-is-finally-released.html)
and in the [official CHANGELOG of the Bitrise CLI](https://github.com/bitrise-io/bitrise/blob/master/CHANGELOG.md).


## OS X Stacks: Cache update

As usual, all of the OS X Stacks received a cache (`brew`, `cocoapods` and `bitrise CLI`) update.
*These Cache updates __do not__ change the pre-installed tool versions, it's
only an update of package manager caches, for faster dependency installs.*

As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

Notable changes (in addition to the CLI version upgrades):

* `Go` was upgraded to `1.6.2` from `1.6.1`

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/a00e8ec142246684846552f417032ec86854bf64](https://github.com/bitrise-io/bitrise.io/commit/a00e8ec142246684846552f417032ec86854bf64).


## Stack / System Reports

You can find the full `system report` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.
