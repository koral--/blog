---
title: Monthly release of Bitrise CLI (June)
date: 2016-06-08 14:05 UTC
tags: announcement
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

>__We will ship a new `bitrise cli` version on the second Tuesday of every month.__ The new release will always be available on [bitrise.io](https://www.bitrise.io) on the weekend after the CLI release.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.3.5)

From now on `bitrise setup` (without any flag) is the equivalent of the previous `bitrise setup --minimal` call (it omits `brew doctor` call, which fails if brew or Xcode is outdated).
You can still use the old *full* setup behavior (which includes `brew doctor`) by calling `bitrise setup --full`. 🤓

This version contains a fix for installing `bitrise` plugins from local paths (e.g. during plugin development).

We've added new `run_if` template [examples](https://github.com/bitrise-io/bitrise/blob/master/_examples/experimentals/templates/bitrise.yml) and we are working on more log improvements.

## New Steps ✨

* __project-scanner 0.9.3__ - scans repository for iOS, Android, Xamarin and fastlane projects 🤖

## Step updates 🛠

* __fastlane 2.2.0__  - new input: `update_fastlane` - control system installed fastlane update
* __web-translate-it 1.0.2__
* __set-android-manifest-versions 1.0.5__
* __xamarin-builder 1.3.0__ - `mac` platform support 🖥
* __nunit-runner 0.9.2__ - fix for determining which project is a valid NUnit test project
* __xamarin-test-cloud-for-ios 1.2.0__ - new output: `BITRISE_XAMARIN_TEST_TO_RUN_ID`
* __xamarin-test-cloud-for-android 1.2.0__ - new output: `BITRISE_XAMARIN_TEST_TO_RUN_ID`
* __deploy-to-itunesconnect-deliver 2.6.0__ - new input: `team_id`
* __cocoapods-install 1.4.0__ - __deprecated__: `is_update_cocoapods`; new inputs: `podfile_path`, `install_cocoapods_version`
* __carthage 2.1.1__ - fixes exit code on errors
* __xcode-archive 1.8.0__ - __deprecated__: is_force_code_sign; new inputs: `BITRISE_PROVISIONING_PROFILE_ID`, `BITRISE_CODE_SIGN_IDENTITY`; GEM_HOME fix/workaround;
* __set-android-manifest-versions 1.0.5__
* __fabric-crashlytics-beta-deploy 2.1.1__ - new input: `dsym_path`; submit command fix
* __certificate-and-profile-installer 1.5.2__ - step now handles two cert & profile 🐙
* __create-install-page-qr-code 0.1.2__
* __post-jira-comment-with-build-details 0.1.5__ - fixed dependency
* __appetize-deploy 0.1.3__ - fixed dependency; Added default option for platform
* __xcode-analyze 1.6.0__ - is_force_code_sign; new inputs: `BITRISE_PROVISIONING_PROFILE_ID`, `BITRISE_CODE_SIGN_IDENTITY`;
* __set-ios-version 1.1.0__
