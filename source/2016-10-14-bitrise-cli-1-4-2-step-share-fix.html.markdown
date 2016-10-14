---
title: Bitrise CLI 1.4.2 - step share fix
date: 2016-10-14 12:59 UTC
tags: announcement, fix, CLI, changelog
authors: Viktor Benei|viktorbenei@bitrise.io
---

[Bitrise CLI `1.4.2`](https://github.com/bitrise-io/bitrise/releases/tag/1.4.2) was just released, and includes two minor fixes.
__The fixes in this quick-fix version do not affect builds__, only step development (step share).

The fixes:

* In `1.4.1` we forgot to bump the `format version` of the CLI, although `1.4.1` had a new YML feature (tag trigger items).
  Format version was bumped in `1.4.2` from `1.3.0` to `1.3.1`. _(The format version information is used
  for checking whether a given CLI version can handle the `bitrise.yml`, to protect against running
  builds which use newer YML properties/syntax with an older CLI version which doesn't have the required
  support)_
* The other fix was in `stepman`, which is the CLI's step library manager. In the previous version of `stepman`
  we changed a bit of how the git branch is structured __when you share your step__ through `stepman`,
  but the new logic had an issue which prevented step sharing through the CLI / through `stepman`.
  This issue was fixed in the new `stepman` and Bitrise CLI versions, and step sharing
  should work as expected again.

There was no other change in this version.
