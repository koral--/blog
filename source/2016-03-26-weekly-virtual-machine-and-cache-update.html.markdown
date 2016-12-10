---
title: Weekly Virtual Machine and Cache update
date: 2016-03-26 13:30 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

Not much changed this week, just general cache updates and Docker image re-builds,
and overall service tweaks. You can find the details below.

## OS X Stacks

The most significant change is that we now have
[Pre-Booted](http://devcenter.bitrise.io/infrastructure/available-stacks/#stack-prepare-types)
capacity for `Xcode 7.3` (the Stack was [introduced this week](http://blog.bitrise.io/2016/03/22/xcode-7-3-final-is-now-available.html), but it was only available
in *On-Demand* configuration initially). This means that most of the times, outside of peak hours,
your Xcode 7.3 stack based build should start right away, it won't have to
wait for the VM to boot.

Pre-Booted configurations are available for the `Android`, `Xcode 7.3`, `Xcode 7.2`
and for the `Xamarin Stable` stacks. Which stacks have Pre-Booted configurations
and how many is based on the usage statistics we collect (mainly: how many builds
run on a given Stack, the ratio to the other Stacks, ...).

All of the OS X Stacks received a Cache update. As everything else we use for
provisioning the OS X VMs, the weekly cache update `Ansible` playbook
can be found on GitHub:
[https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml](https://github.com/bitrise-io/osx-box-bootstrap/blob/master/weekly-cache-update-playbook.yml).


## Android / Linux (Docker) Stack

The only notable change this week is that `Docker` was upgraded from `1.10.2`
to `1.10.3`. This new version of Docker fixed an issue we saw during the week.
It was a rare issue, but it could cause a build to failed right after start,
with an error like "Unrecognized input header".

You can find the diff of this week's update at:
[https://github.com/bitrise-io/bitrise.io/commit/67212a13315dda33aeed338af6f7da4fae04faa9](https://github.com/bitrise-io/bitrise.io/commit/67212a13315dda33aeed338af6f7da4fae04faa9).

If you want to see the full System Report (not just the diff) of the stack,
you can find it on GitHub at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/docker-based-android-setup.log).

If you'd like to add additional tools to be pre-installed you can find the
instructions on [GitHub](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed-on-a-build-machine),
for both the Linux stack and for the OS X stack.

You can also find the `system reports` of all of the available Stacks
on GitHub: [https://github.com/bitrise-io/bitrise.io/tree/master/system_reports](https://github.com/bitrise-io/bitrise.io/tree/master/system_reports).
