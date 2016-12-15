---
title: Monthly release of Bitrise CLI (Dec)
date: 2016-12-14 14:19 UTC
tags: announcement, CLI
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.5.1)

### Bitrise Init Plugin

`bitrise init` command moved to a separate [plugin](https://github.com/bitrise-core/bitrise-plugins-init). This means that you can initialize a new bitrise config by running `bitrise :init`, (previous `bitrise init` command also exists, but it calls the plugin).

The new init plugin uses the same [core](https://github.com/bitrise-core/bitrise-init) of the [Project Scanner step](https://github.com/bitrise-steplib/steps-project-scanner), which is used by the [btrise.io](https://www.bitrise.io) website when adding a new app.

You can create a project type based init by running: `bitrise :init` or create a 'custom' configuration by calling `bitrise :init --minimal`.

### Step updates

In the previous versions of `bitrise-cli`, available step version updates were indicated in the build log, only if a step failed.

Step version update is important information, so from now on it will be printed regardless of the step run status.

### `bitrise validate` command fixes

The validate command is responsible to make sure that the bitrise configuration (bitrise.yml) and secrets (.bitrise.secrets.yml) files are valid for the bitrise-cli.

This validation is always performed before a workflow run and also used by the [bitrise.io](https://www.bitrise.io/) website's workflow editor.

From now the validation fails, if the specified bitrise configuration or secrets files are empty. We made a review on the validation command's exit status and added integration tests to make it reliable.

### Other changes

We've expanded the bitrise-cli docs with [bitrise.yml format specification / reference](https://github.com/bitrise-io/bitrise/blob/master/_docs/bitrise-yml-format-spec.md). This document describes the bitrise configuration file (bitrise.yml).

bitrise-cli 1.5.1 uses stepman 0.9.26 and shipped with some logging updates around available workflow list.


## New version of Stepman (0.9.26)

### Step run timeout

StepModel got a new property: `Timeout`. This new property prepares a feature __step timeout handling__. The new timeout handling feature will be shipped __in the next bitrise-cli release__.

### `step-list` command revision

To easily get summary of steps in the specified steplib.

steplist item looks like:

<pre><code> * STEP_TITLE
   ID: STEP_ID
   Latest Version: LATEST_VERSION
   Summary: STEP_SUMMARY</code></pre>

for example:

<pre><code> * Sign APK
   ID: sign-apk
   Latest Version: 1.1.1
   Summary: Sign APK</code></pre>

### Step model updates

StepModel .json and .yml representation now ommits empty `Source` and `Deps` properties, instead of printing empty struct for these values.

## New Steps

- __ipa-info 1.0.0__
- __bower 0.1.3__
- __gulp 0.1.1__
- __github-status 0.9.0__
- __steps-cordova-ios 0.1.0__
- __aws-device-farm-runner 0.0.4__

## Step updates 🛠

- __project-scanner 0.11.3:__
  - Added update android extra packages to android workflows
  - Removed `extra-android-support` install
- __giphy 0.1.1:__
  - Fixed spaces not being taken into account in gif keywords. Now space can truly be the final frontier. 🚀
- __appaloosa 1.3.0:__
- __xcode-test 1.18.1:__
  - new input: `wait_for_simulator_boot` - (Experimental) Wait to simulator boot before test run?
  - xcpretty html test report fix
  - `app accessibility is not loaded` retry pattern
- __amazon-s3-deploy 3.5.1:__
  - Fixed a typo when calling `log_warn` (#20), thanks @Reprazent!
- __carthage 3.0.1:__
  - [Breaking changes](https://github.com/bitrise-steplib/steps-carthage/releases/tag/3.0.0) on inputs
  - Typo fix https://github.com/bitrise-steplib/steps-carthage/pull/29
- __xcode-archive 2.0.4:__
  - v2.0.0 [major updates](https://github.com/bitrise-io/steps-xcode-archive/releases/tag/2.0.0)
  - Fixed xcodebuild force options
  - Ensure close xcpretty outputs
  - step.yml updates
  - Typo fixes
  - Minor fixes
  - `export_all_dsyms` default value is set to `yes`
  - Removed rvm fix
- __google-play-deploy 1.0.1:__
  - Fixed edit commit, fix for: https://github.com/bitrise-steplib/steps-google-play-deploy/issues/12
  - __NEW INPUT:__ `whatsnews_dir` - Direcotry of localised whatsnew files
- __export-xcarchive 0.9.1:__
  - __NEW OUTPUT:__ `BITRISE_IDEDISTRIBUTION_LOGS_PATH` - path to the ide distribution logs in case of exporting ipa with export. This output will be exported only if export fails.
  - Minor fixes
- __export-xcarchive-mac 0.9.1:__
  - __NEW OUTPUT:__ `BITRISE_IDEDISTRIBUTION_LOGS_PATH` - path to the ide distribution logs in case of exporting ipa with export. This output will be exported only if export fails.
  - Minor fixes
- __deploy-to-itunesconnect-deliver 2.7.1:__
  - Prints performed deliver command
  - step.yml updates, thanks https://github.com/bitrise-io/steps-deploy-to-itunesconnect-deliver/issues/12
  - __NEW INPUT:__ `options` - Additional options for `deliver` call
  - go-toolkit support
  - Implemented missing team args https://github.com/bitrise-io/steps-deploy-to-itunesconnect-deliver/pull/17
- __create-android-emulator 1.0.0:__
  - __NEW INPUT:__ `options` - Additional options for `android create avd` call
  - __NEW INPUT:__ `custom_hardware_profile_content` - Custom Hardware Profile Content
  - go-toolkit support
  - Android package install check fix
- __nuget-restore 1.0.3:__
  - Retry Nuget restore if fail
  - Nuget restore retry fix
- __git-tag 1.1.0:__
- __cocoapods-install 1.5.8:__
  - go-toolkit support
  - Step description update
- __nunit-runner 1.1.2:__
  - Custom options fix
