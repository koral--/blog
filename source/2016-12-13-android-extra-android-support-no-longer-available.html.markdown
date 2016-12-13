---
title: Android - extra-android-support package is no longer available
date: 2016-12-13 20:11 UTC
tags: announcement, status, android, fix
authors: Viktor Benei|viktorbenei@bitrise.io
---

Starting today you might get an error:

<pre><code>Error: Ignoring unknown package filter 'extra-android-support'
</code></pre>

__This is because the `extra-android-support` package is no longer
available in the Android repository.__ It's simply no longer possible to install
this package through the android sdk package manager.

Fortunately __the solution__ is quite simple: don't install this package,
and if required update your source code to not to depend on it.

For example you might have a line like this in your build configuration,
e.g. in a `Update Android Extra packages` script step:

<pre><code>echo y | android update sdk --no-ui --all --filter extra-android-support | grep 'package installed'
</code></pre>

Replace this with the new packages:

<pre><code>echo y | android update sdk --no-ui --all --filter extra-android-m2repository | grep 'package installed'
echo y | android update sdk --no-ui --all --filter extra-google-m2repository | grep 'package installed'
</code></pre>

Or if you already have those, just simply remove the
`echo y | android update sdk --no-ui --all --filter extra-android-support | grep 'package installed'`
line.

_Note: you can __edit the build configuration by clicking the `Workflow` tab__
on your app's [bitrise.io](https://www.bitrise.io) page,
selecting the related step (e.g. `Update Android Extra packages`),
then on the right side you can see the script's content
in the `Script content` option. You can edit the content there,
and then click `Save` to save the change. Your next build will
start with the new configuration._
