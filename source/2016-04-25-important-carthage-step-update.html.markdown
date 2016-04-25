---
title: Important Carthage Step update
date: 2016-04-25 18:50 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

If you use the `Carthage` step's `2.0.0` or `2.0.1` version
you should upgrade it to the latest, `2.0.2` version, or else
you might get an error complaining about the working
directory (unless you do set a working directory).

This issue is related to the [empty environment variable and input value handling](/2016/04/13/new-version-of-the-bitrise-cli-1-3-0-is-finally-released.html)
introduced in the Bitrise CLI `1.3.0`.

The Carthage step received a full rewrite in Swift for the
version `2.0.0`, and Swift handles undefined environment variables
in a different way compared to defined but empty environment variables.

Bitrise CLI `1.3.0` now normalizes every specified environment
variable and input (inputs are environment variables too 😉),
and sets an empty string as the value, instead of skipping (not defining)
the environment variable if the value is not defined.

So, if you'd have an issue with the Carthage step please upgrade
to version `2.0.2`. It's exactly the same as `2.0.1`, but it
can now properly handle both undefined and empty string values
set as the Working Directory option.