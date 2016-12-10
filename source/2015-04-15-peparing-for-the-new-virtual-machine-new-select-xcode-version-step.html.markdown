---
title: Peparing for the new virtual machine - new Select Xcode version step
date: 2015-04-15 18:21 UTC
tags: announcement, step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

As we announced in our previous blog post the new virtual machine
will be available during the weekend and it will include
Xcode 6.3 (final/stable).

An important change compared to the current virtual machine
is that it won't include any beta Xcode versions
because when we started to prepare it on Monday
there was no new beta Xcode.

We introduced our *Select Xcode version* step a while ago
and since that this is the first time we don't include an
Xcode beta on our virtual machines.

This, unfortunately, introduced a design flaw in the step:
the initial version (v1.0.0) included only two selectable options,
`-stable` and `-beta`. This effectively means that in case you
selected the `-beta` option your *Select Xcode version* step
will start to fail after the virtual machine update.

We discussed the migration options internally and finally we decided
to keep the `-beta` option, mainly for compatibility, but to
introduce a new, third option: `-latest`. If you select this new option
then you'll always use the latest available Xcode, be it a beta
or a stable Xcode version.

The new v1.1.0 version of the *Select Xcode version* step is now
available, so you can prepare for the weekend.

## As a brief summary this is the description of the new version:

* `-stable`: refers to the latest *stable* release version of Xcode which is installed in the Virtual Machine.
* `-latest`: refers to the latest available Xcode version in the Virtual Machine. This can be a *beta* or a *stable* Xcode version (*stable* in case there's no beta version available).
* `-beta`: refers to the latest *beta* version of Xcode pre-installed in the Virtual Machine.

Generally you should *not* use the `-beta` channel as it will fail in case there's
no *beta* Xcode available on the Virtual Machine. This, however, can be used
in case you want to use the latest *beta* until it gets to a stable state,
so when this step fails you can most likely switch to the `-stable` channel.
In every other case, if you want to use the absolutely latest Xcode version
(which might be a beta) you should use the `-latest` channel, which will
not fail if there's no beta version available, but rather it will use
the latest installed stable version instead.
