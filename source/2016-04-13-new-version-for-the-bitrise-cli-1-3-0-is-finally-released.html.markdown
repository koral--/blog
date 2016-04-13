---
title: New version for the Bitrise CLI (1.3.0) is finally released! 🎉
date: 2016-04-13 11:33 UTC
tags: announcement
authors: Daniel Balla|danielballa@bitrise.io
---

<iframe src="//giphy.com/embed/9tx0gy37p7oXu?hideSocial=true" width="100%" height="300" frameborder="0" class="giphy-embed" allowfullscreen=""></iframe>

This new version contains tons of improvements, fixes and new features; it is built up by 154 git commits in the main repo and countless others in `envman` and `stepman` and the plugins. 😱  We've been working on this new release for a long time now, the previous version (1.2.4) was published in November, 2015. 1.2.4 is SO last year. After this release, we will ship a new `bitrise cli` version **on the second Tuesday of every month.** The new release will always be available on bitrise.io on the following weekend after the CLI release.

Read on to find out what's changed!

##💥 Breaking change:

We've updated [envman](https://github.com/bitrise-io/envman/releases/tag/1.1.0), which is an environment manager tool used by `bitrise cli`, to make it possible to delete/reset environment variables by setting the value to an empty string ("").
Previously an empty value (e.g. - an_input: "") was just ignored, now it actually sets the value to an empty one.

The previous version caused an issue when you had two Git Clone steps after each other. The `git-clone` step has an input called `pull_request_id`, with the default value of `$BITRISE_PULL_REQUEST` which got its value through bitrise.io whenever a build was triggered by pull request.
The second `git-clone` step also received this same value, even if it would have cloned another repository.
This is not cool by any measure, so now you can just clear that input by adding an empty string as value:

<pre><code>- git-clone:
    ...
    inputs:
    - pull_request_id: ""
    ...
</code>
</pre>

##🛠 New Plugin system (beta):

We've built a plugin management system into `bitrise cli` to extend its functionality without modifying the "core". With this new plugin system we want to keep the `bitrise` core functionality (running a workflow) stable and persistent, so other functions will be converted to plugins.

Currently the plugin system is in beta, however the CLI's new version is shipped with the `analytics` plugin (more info in the following section), which will be installed during the `bitrise` setup process.

Here's a list of available plugin commands:

- Install plugin: `bitrise plugin install [PLUGIN_NAME]`
- Delete plugin: `bitrise plugin delete [PLUGIN_NAME]`
- List installed plugins: `bitrise plugin list`
- Run plugin: `bitrise :[PLUGIN_NAME]`
- The CLI now installs all default plugins on `bitrise` setup.

###📈 Analitycs plugin:

The analytics plugin submits anonymized usage information about integrations to help us identify any problems with them.
The sent data only contains information about steps (id, version, runtime, error), **NO logs or personal data is included.** 🔒

However, if you feel that's still too much, you can opt-out by calling `bitrise :analytics off`.

##Getting started with React Native just became a bit easier

You can now find [an example YAML](https://github.com/bitrise-io/bitrise/blob/master/_examples/tutorials/react-native/bitrise.yml) file in the tutorials section of the CLI's repo. You're just one copy/paste away to start crafting React Native workflows with `bitrise`.

##More clarity

We've also updated several command's output to be more informative (see: `bitrise workflows`, `bitrise step-info [STEP_ID]`, `bitrise step-list`, etc...). This version got an updated `bitrise validate` function, which validates your workflow and secret files. The update contains *workflow id validation (until this version, workflow id should conform to `[A-Za-z0-9-_.]`)* and *check for duplicated step inputs*.
