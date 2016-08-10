---
title: Monthly release of Bitrise CLI (Aug)
date: 2016-08-09 14:59 UTC
tags: announcement
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

# Monthly release of Bitrise CLI (Aug)

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.3.7)

__Bitrise version 1.3.7 contains major updates around workflow run related commands' flags (`run`, `trigger` and `trigger-check`) and feature/internal tools handling.__

This update prepares the bitrise cli for the __new trigger handling__, which will include __pull request__ and git __tagging__ trigger support. You can find more details [on this github proposal](https://github.com/bitrise-io/bitrise.io/issues/40).

#### run command

From now you can specify __workflow id to run__ with `--workflow` flag for `bitrise run` command.  
Example: `bitrise run --workflow WORKFLOW_ID`.  
_In previous versions you were able to specify workflow id to run as a command argument (`bitrise run WORKFLOW_ID`); this method is still supported._

#### trigger command

Similar to run command's new `--workflow` flag, `trigger` and `trigger-check` commands also received new flag for specifying the __trigger pattern__: `--pattern`.  
Example: `bitrise trigger --pattern PATTERN`.  
_In previous versions you were able to specify the pattern as a command argument (`bitrise trigger PATTERN`); this method is still supported._

#### json-params

Every workflow run related commands (`run`, `trigger`, `trigger-check`) now have new inputs:

  - `--json-params`
  - `--json-params-base64`.

You can use `--json-params` to specify __every available command flags__ (_except --json-params and --json-params-base64_) in a single json struct. This json struct should be a string-string map, where every key is the command flag's name, and the value should be the flag's value.  

For example:   
`bitrise run --config bitrise.yml --workflow primary`

Equivalent with json-params:  
`bitrise run --json-params '{"config":"bitrise.yml", "workflow":"primary"}'`  

To see the command's available flags, call `bitrise COMMAND -h`.

If you want to avoid character escaping side effects while running the `bitrise` cli, you can base64 encode --json-params value and pass to bitrise cli using the `--json-params-base64` flag.

#### feature/internal tools

__The `envman` and `stepman` (used by `bitrise`) tools install path is moved from `/usl/local/bin` to `$HOME/.bitrise/tools`__ to make sure bitrise cli uses the desired tool version.  
Also `stepman` min version updated to [0.9.22](https://github.com/bitrise-io/stepman/releases/tag/0.9.22).

## New version of Stepman (0.9.22)

__The new version includes fixes for `stepman setup` and `stepman update` for the case of working with local steplib.__

## New Steps ✨

- __pebble-build 1.0.0__
- __nvm 1.0.1__
- __recreate-user-schemes 0.9.1__
- __resign-ipa 1.0.0__

## Step updates 🛠

- __xcode-archive 1.8.5__
  - step ensures that xcarchive is generated after archive command
  - debug prints the exposed paths
- __project-scanner 0.9.10__
  - xamarin user management step fix
  - add `recreate-user-schemes` step if iOS project does not contain shared schemes (✨)
  - `podfile` handling fixes
  - added `FASTLANE_XCODE_LIST_TIMEOUT` to fastlane workflows
  - logging updates
- __version-pre-release-info 1.0.2__
- __xamarin-test-cloud-for-android 1.2.1__
  - proper error message, if test project does not refer to any projects
  - stability updates
- __codecov 1.1.3__
  - __new input__: `other_options` - additional options for Codecov call
  - add argument to exit 1 upon failure
  - remove `--codecov` from other_options
- __carthage 2.2.0__
  - added support for carthage checkout command
- __certificate-and-profile-installer 1.6.0__
  - logging updates
  - __new input__: `export_certificate_and_profile_infos` - should export Certificate and Provisioning Profile infos
- __xcode-test-mac 1.0.5__
- __xcode-test 1.14.0__
  - run xcodebuild with `NSUnbufferedIO=YES` env
  - BootSimulator - multi Xcode bug fix
- __xcode-archive-mac 1.2.0__
  - fixed export command
  - uses unified export options generator
- __xamarin-builder 1.3.6__
  - no expected output explanation
- __xamarin-test-cloud-for-ios 1.2.1__
  - proper error message, if test project does not refer to any projects
  - stability updates
- __git-clone 3.3.3__
  - rewrite in go
  - retry with wait time
  - `git fetch --tags` before checkout tag
  - removed SSH operations (handled by activate-ssh-key step)
  - fix for: depth specified and required commit not found
- __script 1.1.2__
  - if runner is bash, the Step will now perform a syntax check first (`bash -n FILEPATH`)
- __post-jira-comment-with-build-details 0.1.8__
- __activate-ssh-key 3.1.1__
  - removed the `project_type_tags` filter - this step can be used regardless of the project type
- __random-quote 3.0.2__
  - retry if request failed
- __set-xcode-build-number 1.0.4__
  - added `type_tag: versioning`
- __deploy-to-itunesconnect-deliver 2.6.1__
  - typo fixed

__Happy Building!__ 🚀
