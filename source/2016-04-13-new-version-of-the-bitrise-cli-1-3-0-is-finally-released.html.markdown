---
title: New version of the Bitrise CLI (1.3.0) is finally released! 🎉
date: 2016-04-13 11:33 UTC
tags: announcement
authors: Daniel Balla|danielballa@bitrise.io
---

<iframe src="//giphy.com/embed/9tx0gy37p7oXu?hideSocial=true" width="100%" height="300" frameborder="0" class="giphy-embed" allowfullscreen=""></iframe>

This new version contains tons of improvements, fixes and new features.

The primary focus of this release was mainly revisions and stability,
with the new Plugins feature we'll try to keep the core of the CLI unaffected by
new features and modifications (more info about the Plugin feature a bit later).

This release is built up by 154 git commits in the [main Bitrise CLI repo](https://github.com/bitrise-io/bitrise) - full [changelog](https://github.com/bitrise-io/bitrise/blob/master/CHANGELOG.md#130-2016-apr-12) -
and countless others in [envman](https://github.com/bitrise-io/envman), [stepman](https://github.com/bitrise-io/stepman)
and the plugins. 😱  We've been working on this new release for a long time now, the previous version (`1.2.4`) was published in November, 2015.
*`1.2.4` is SO last year.*

After this release, **we will ship a new `bitrise cli` version on the second Tuesday of every month**.
The new release will always be available on [bitrise.io](https://www.bitrise.io) on the weekend after the CLI release.

Read on to find out what's changed!

## 💥 Breaking change:

We've updated [envman](https://github.com/bitrise-io/envman/releases/tag/1.1.0) (the environment variable manager tool
used by `bitrise cli`) to make it possible to delete/reset environment variables by setting the value to an empty string (`""`).
Previously an empty value (e.g. `- an_input: ""`) was just ignored, **now it actually sets the value to an empty one**.

The previous version caused an issue when, for example, you had two `Git Clone` steps after each other.
The `git-clone` step has an input called `pull_request_id`,
with the default value set to `$BITRISE_PULL_REQUEST` (which gets its value through [bitrise.io](https://www.bitrise.io) whenever
a build is triggered by a pull request).

The second `git-clone` step also received this same value, even if it would have cloned another repository,
because even if you did set the value to an empty string in your `bitrise.yml` configuration, the empty
value was just ignored, and the default value (`$BITRISE_PULL_REQUEST`) was used instead.

This is not cool by any measure, so now you can just clear any input by specifying an empty string as the value:

<pre><code>- git-clone:
    ...
    inputs:
    - pull_request_id: ""
    ...
</code>
</pre>


## 🛠 New Plugin system (beta):

We've built a plugin management system into `bitrise cli` to extend its functionality without modifying the "core".

With this new plugin system we want to keep the `bitrise` CLI core functionality (running and managing workflows)
as stable and compatible as possible, so most of the other commands will be converted to plugins,
and new functionality will also be implemented as plugins, unless it really have to be part of the "core".

Currently the plugin system is in beta,
the CLI's new version ships with only one plugin, `analytics` (more info about this plugin in the following section),
which will be installed during the `bitrise setup` process.

Here's a list of available plugin commands:

- Install plugin: `bitrise plugin install [PLUGIN_NAME]`
- Delete plugin: `bitrise plugin delete [PLUGIN_NAME]`
- List installed plugins: `bitrise plugin list`
- Run plugin: `bitrise :[PLUGIN_NAME]`

*Note: The CLI installs all "core" plugins at `bitrise setup` (when you run the new `bitrise` the first time).
Right now the only "core" plugin is `analytics`.*


### 📈 Analitycs plugin:

The analytics plugin submits anonymized usage information about integrations (steps) to help us identify possible problems with them.

**The sent data only contains information about steps (id, version, runtime, error code) and about the CLI (version),
NO logs or personal data is included.** 🔒

We'll also open source the Analytics server's source code in the near future!

However, if you feel that's still too much, you can opt-out by calling `bitrise :analytics off`.

## Getting started with React Native just became a bit easier

You can now find [an example YAML](https://github.com/bitrise-io/bitrise/blob/master/_examples/tutorials/react-native/bitrise.yml) file in the tutorials section of the CLI's repo. You're just one copy/paste away to start crafting React Native workflows with `bitrise`.

## More clarity

We've also updated several commands' output to be more informative (see: `bitrise workflows`, `bitrise step-info [STEP_ID]`, `bitrise step-list`, etc...). This version got an updated `bitrise validate` function, which validates your workflow and secret files. The update contains *workflow id validation (until this version, workflow id should conform to `/[A-Za-z0-9-_.]+/`)* and *check for duplicated step inputs*.

*Note: we'll move most of these commands / functionality into "core" plugins in the upcoming CLI releases.*

Let us know what you think about this new release!
