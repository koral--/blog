---
title: "Android: Could not find ... appcompat-v7 - how to update preinstalled packages"
date: 2016-08-19 11:50 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

> __You can find an up to date version of this issue and fix__
> on our [DevCenter](https://bitrise-io.github.io/devcenter/android/frequent-android-issues/#could-not-find-an-android-package-or-you-have-not-accepted-the-license-agreements)

If you'd get an error in your Android build like:

<pre><code>Could not find com.android.support:appcompat-v7:24.2.0. 
</code></pre>

or:

<pre><code>You have not accepted the license agreements of the following SDK components:
</code></pre>

it means that your Android build requires an Android package which is either not (yet) preinstalled
(_you can see which packages are preinstalled [here, on GitHub](https://github.com/bitrise-docker/android/blob/master/Dockerfile#L30) -
feel free to send us a Pull Request if you'd want to add a new preinstalled package!_),
__or outdated__.

> We update the preinstalled Android packages on every weekend, so if the error
> is related to an outdated package, the workaround
> we describe here can be removed from your build after that weekend's update.

__How to fix these errors?__

It's quite simple, you just have to update or install the related Android package.
You can do this with a `Script` step (_can be the first step in the Workflow_),
just specify this as the content of the `Script` step to update the
packages related to the errors above:

<pre><code>#!/bin/bash
# fail if any commands fails 
set -e 
# debug log 
set -x

# write your script here 
echo y | android update sdk --no-ui --all --filter extra-android-support | grep 'package installed' 
echo y | android update sdk --no-ui --all --filter extra-android-m2repository | grep 'package installed'
echo y | android update sdk --no-ui --all --filter extra-google-m2repository | grep 'package installed'
</code></pre>


**Happy Building!** 🚀