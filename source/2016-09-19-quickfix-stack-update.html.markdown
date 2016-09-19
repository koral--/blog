---
title: Quickfix stack update
date: 2016-09-19 15:28 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

To fix the homebrew issue we described in our [previous blog post](/2016/09/19/brew-issue-and-fix.html)
we performed a minimal "quickfix" stack update.

The quickfix only included a regular `brew update` and the addition of a couple of Homebrew
related environment variables, to disable the "auto update" and "analytics" features of Homebrew
on all stacks, nothing else changes.

The following environment variables are now defined on all stacks:

<pre><code>export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
</code></pre>

([Source](https://github.com/bitrise-io/osx-box-bootstrap/blob/f4da692a405e01bbecd1d7e7af4fdfe35e5e322c/profiles/bashrc#L8))

You can find the system report diffs of all MacOS stacks at: [https://github.com/bitrise-io/bitrise.io/pull/70/files](https://github.com/bitrise-io/bitrise.io/pull/70/files)
