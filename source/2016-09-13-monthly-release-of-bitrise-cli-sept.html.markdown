---
title: Monthly release of Bitrise CLI (Sept)
date: 2016-09-13 14:54 UTC
tags: announcement
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.4.0)

Bitrise 1.4.0 major features:

- __New trigger map__
- __Toolkit support (_BETA_)__
- __Step dependency handling revision__

### New trigger map

Bitrise contains a new trigger map syntax, to allow setting more specific and felxible trigger events. Full proposal is available on [GitHub](https://github.com/bitrise-io/bitrise.io/issues/40).

Keep in mind:

* Every single trigger event should contain, at minimum, one condition.
* Every single trigger event condition is evaluated with AND condition.

Following trigger item types were introduced:

__code push:__

<pre><code>- push_branch: BRANCH_NAME
  workflow: WORKFLOW_ID_TO_RUN
</code></pre>

__pull request:__

<pre><code>- pull_request_source_branch: SOURCE_BRANCH_NAME
  pull_request_target_branch: TARGET_BRANCH_NAME
  workflow: WORKFLOW_ID_TO_RUN
</code></pre>

example:

<pre><code>trigger_map:
- push_branch: release*
  workflow: deploy
- push_branch: master
  workflow: primary
- pull_request_target_branch: develop
  workflow: test
</code></pre>

_New trigger map handling is fully compatible with the old syntax, the following conversion is applied:_

<pre><code>Old syntax:                   New Syntax:

trigger_map:                  trigger_map:
- pattern: *           ->     - push_branch: *
  workflow: primary             workflow: primary
</code></pre>

<pre><code>Old syntax:                                New Syntax:

trigger_map:                               trigger_map:
- pattern: *                        ->     - push_branch: *
  is_pull_request_allowed: true              workflow: primary
  workflow: primary                        - pull_request_source_branch: *
                                              workflow: primary
</code></pre>

__The new trigger map syntax will be available on [bitrise.io](https://www.bitrise.io) soon.__

We are also planing to prepare bitrise for __trigger with git tagging event__, so keep your eyes out for upcoming updates.

### Toolkit support (_BETA_)

_Toolkit support is still in beta and details of it might change in following CLI releases._

Currently available toolkits: `bash` and `go`.

__bash toolkit__ realizes the current step handling, e.g.: every step needs to have a `step.sh` in the step's directory as an entry point for the step. When bitrise executes the step, it calls `bash step.sh`.

In case of __go toolkit__, you need to specify the package name, and the toolkit takes care about:

* moving the go step into a prepared GOPATH inside of the .bitrise directory
* building the step project
* chaching the binary of the step's given version

When bitrise executes the step, it calls the step's binary.

Using the toolkit can provide __performance benefits__, as it does automatic binary caching - which means that a given version of the step will only be compiled the first time, subsequent execution of the same version will use the compiled binary of the step!

__Toolkit also takes care of its own dependencies.__ For example, go toolkit requires go installed, so the toolkit checks whether the desired version of go is installed on the system. If not, it installs it automatically (inside the .bitrise directory), but does not touch the system installed version.

Check out the all-new `Slack` step for a real life example of go toolkit usage: [slack v2.2.0](https://github.com/bitrise-io/steps-slack-message/releases/tag/2.2.0)

### Step dependency handling revision

In previous releases bitrise was checking if step dependencies are available by calling the specified dependency manager's listing method. If the list does not contain the dependency, bitrise installed it, even if the tool was installed in another way. This version of bitrise checks for the dependecy in its manager's list and also in the `$PATH` environment.

On the other hand, some tools have different package name and binary name, for example AWS CLI's package name is `awscli` and the binary is `aws`. With the new `bin_name` property of step dependencies you can eliminate this issue.
If bin_name is empty name will be used as bin_name too.

#### Other changes:

* Every __networking__ function of bitrise CLI uses __retry logic__ and prints progress indicator.
* bitrise run now prints _Running workflow: WORKFLOW_ID_, for the workflow started running and prints _Switching to workflow: WORKFLOW_ID_ when running before and after workflows.
* bitrise configuration (`bitrise.yml`) __format version__ updated to __1.4.0__
* __stepman__ version update to [0.9.23](https://github.com/bitrise-io/stepman/releases/tag/0.9.23)
* __envman__ version update to [1.1.1](https://github.com/bitrise-io/envman/releases/tag/1.1.1)

## New version of Stepman (0.9.23)

This version of stepman were introduced to support bitrise CLI's __toolkit support__ and the __dependency revision__.

For the toolkit support we've introduced the `toolkit` property of steps (available values: `go` and `bash`). For using the go toolkit you need to define the step's go `package name`, bash toolkit requires the `entry_file` property to be specified.

As part of the dependency revision, step dependency got a new field `bin_name`.

## New version of Envman (1.1.1)

Envman got a new command `version`, which is also available in other bitrise tools (`bitrise` and `stepman`), which prints envman's version. Use `--format` flag to specify output format (available values: `json`, `yml` and `raw`), to print build informations like `build_number` and `commit` of the release use the `--full` flag.

This tool also received some dependency and unit test updates.

## Step updates 🛠

* __project-scanner 0.9.13__
  * omitting xcodeproj and xcworkspace which is not a directory
  * add script step to default workflow
  * add xcode-test to a correct scheme option
  * fixed scheme generation if no shared scheme found
* __nuget-restore 0.9.3__
  * do not run commands with eval
  * cmd call fix
* __xcode-archive 1.9.1__
  * __NEW INPUT:__ `export_all_dsyms`
    If this input is set to `yes`, the step will collect every dsym (.app dsym and framwork dsyms) in a directory, zip it and export the zipped directory path. Otherwise only .app dsym will be zipped and the zip path exported.
  * __New ipa export related inputs:__
	* `export_method`: Select method for export
	* `upload_bitcode`: Include bitcode?
	* `compile_bitcode`: Rebuild from bitcode?
	* `team_id`: The Developer Portal team to use for this export
  * __New xcode 8 related inputs:__
 	* `force_team_id`: Force Developer Portal team to use during archive
	* `force_provisioning_profile_specifier`: Force code signing with Provisioning Profile Specifier
* __cocoapods-install 1.5.7__
  * __NEW INPUT:__ `verbose` - Execute cocoapods in verbose mode?
  * use sudo for gem management (install/uninstall) commands if system ruby used
  * bundle install - parallel and retry
* __npm 0.1.1__
  * __NEW INPUT:__ `workdir` - Working directory
* __xamarin-builder 1.4.0__
  * use preinstalled touch unit exe or download it
  * prefer -Signed.apk postfixed path if android archive signs the apk file
  * Touch.Unit related functionality
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __xcode-archive-mac 1.3.0__
  * __NEW INPUT:__ `is_export_xcarchive_zip` - Export the generated archive?
  * __NEW INPUT:__ `is_export_all_dsyms` - Export all dsyms?
* __xamarin-test-cloud-for-calabash-ios 0.9.4__
  * ensure required gems (calabash-cucumber, xamarin-test-cloud)
* __gradle-runner 1.4.1__
  * __`workdir` input was removed__, for compatibility with other steps like [Gradle Unit Test](https://github.com/bitrise-io/steps-gradle-unit-test)
  * `gradlew path` is now required; added comments & links to help with generating one if required
  * other minor bug fixes and updates/revision
* __react-native-bundle 1.0.1__
  * __removed minify option__ because it's no longer supported in react-native 0.31.0
  * use __bundle-output__ flag instead of out
  * react-native bundle command options review
* __start-android-emulator 1.1.0__
  * __NEW INPUT:__ `emulator_options` - control all emulator commands' flags
  * __DEPRECATION:__ `other_options` - use emulator_options instead
* __git-clone 3.3.4__
  * proper error messages
* __resign-ipa 1.1.0__
  * Add `app_id_prefix` as input
  * log configs
* __xamarin-test-cloud-for-android 1.2.2__
  * step.yml formatting fixes
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __deploy-to-bitrise-io 1.2.5__
  * added retry and parallel params to bundle install
* __recreate-user-schemes 0.9.4__
  * go 1.5 support
  * fixed scheme generation
* __script 1.1.3__
  * typo fix in the Step's description
* __nunit-runner 0.9.3__
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __xamarin-ios-test 1.0.4__
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __xamarin-test-cloud-for-android 1.2.3__
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __xamarin-test-cloud-for-ios 1.2.2__
  * force kill hanging mdtool command
  * print full stack trace of hanging mdtool command
  * retry if mdtool command hangs
* __project-scanner 0.9.12__
  * bitrise-init tool update
* __slack 2.3.0__
  * step uses __toolkit__
  * it can also use Slack's "Attachment" API feature to send the message, which allows a border color
  * __BREAKING:__ removed formatting_mode, as there's no use for it anymore

## Removed Steps

* __lifx__
  * removed lifx step, because its git repository was deleted 🔅
