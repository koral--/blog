---
title: brew issue and fix
date: 2016-09-19 14:07 UTC
tags: macos, fix, brew
authors: Viktor Benei|viktorbenei@bitrise.io
---

Homebrew (`brew`) started a migration away from owning the complete `/usr/local` directory,
but the migration process might cause an issue if you do a `brew install` right now:

<pre><code>==> Migrating HOMEBREW_REPOSITORY (please wait)...
==> Migrated HOMEBREW_REPOSITORY to /usr/local/Homebrew!
Homebrew no longer needs to have ownership of /usr/local. If you wish you can
return /usr/local to its default ownership with:
  sudo chown root:wheel /usr/local
/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/ruby: No such file or directory -- /usr/local/Library/Homebrew/brew.rb (LoadError)
</code></pre>

If you get this error or your brew install fails, the workaround for now is to run `brew update` before any `brew install`, separately.
This can be done with e.g. a `Script` step - just add it to your workflow as the very first step,
with just this content:

<pre><code>#!/bin/bash
brew update
</code></pre>

You can find the related Homebrew issue [on GitHub](https://github.com/Homebrew/brew/issues/987),
and we're also working on an emergency stack update, to fix this issue on the affected stacks.

