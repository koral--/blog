---
title: Bitrise CLI 1.3.0 issue - fix is coming ASAP
date: 2016-04-18 12:36 UTC
tags: status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We just discovered a critical issue in the latest CLI (the one which was published
on the VMs this weekend): the CLI does not return the expected exit code.

This means that even if the build fails it will not be marked as a failed build
on [bitrise.io](https://www.bitrise.io). Functionally the build will
run correctly, and the error will be printed in the logs, but the build
won't be marked as failed on the Web UI.

We're terribly sorry for the issue & the inconvenience this caused,
we'll fix it ASAP and make it sure that this will never happen again!

**We will update this blog post when the issue is resolved!**