---
title: Virtual Machine quickfix update summary
date: 2015-05-05 08:24 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

You might have seen it on our [Twitter](https://twitter.com/bitrise){:target="_blank"}
but we wanted to summarize the quickfix we had to make yesterday.

We discovered an issue yesterday afternoon with the new virtual machine
which caused problems with environment variable priority handling.
This affected builds where multiple values were defined for the same
environment variable key. You can read more details
on our [GitHub issue tracker](https://github.com/bitrise-io/bitrise.io/issues/6){:target="_blank"}.

We developed the fix which required a virtual machine
patch update, which we rolled out yesterday late afternoon.
This fixed the issue but unfortunately updated the preinstalled
**CocoaPods** version from `0.36.4` to `0.37.0`.

We're terribly sorry for the inconvenience this might have caused to you,
*please contact us if you need help with downgrading the preinstalled
CocoaPods version*.

We created the necessary tests and changes so these issues won't happen again in
the future.
