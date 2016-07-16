---
title: Monthly release of Bitrise CLI (July)
date: 2016-07-13 10:11 UTC
tags: announcement
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

# Monthly release of Bitrise CLI (July)

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.3.6)

__Bitrise version 1.3.6 contains minor fixes and updates, the relevant change is the new Stepman [v0.9.21](https://github.com/bitrise-io/stepman/releases/tag/0.9.21) dependency.__

From now on the build log's summary contains a "Not provided" message if `source_code_url` or `support_url` is missing. The update contains some typo fixes and guide updates.

## New version of Stepman (0.9.21)

__This stepman release contains major updates around `step-info` and `step-list` commands, also a new command wired in for exporting the StepLib spec: `export-spec`.__


We decided to remove every command's short version (a.k.a. command alias), because it was not representative enough and the overlap between `download` and `delete` commands' alias (`d`) caused a conflict.

`step-info` command's `collection` input - *which you can use to specify the StepLib as source of the step* - is now __required__, to make it less confusing, when multiple StepLibs contain the same step.

We improved the logging of the `step-list` command, to make it clear which StepLib contains the step list.

You can now generate the StepLib's spec - *spec.json is a descriptor for the StepLib, used by other parts of bitrise (like the website, or the integrations page)* - by calling `stepman export-spec` command.
You can control the functionality with the following flags:

- `--steplib`: specify the StepLib with the StepLib's git URI
- `--output`: where stepman should save the exported spec file
- `--export-type`: controls what should be included in the spec - available options:

  - `full`: contains all meta information about the StepLib and every version of all steps along with their information
  - `latest`: contains all meta information about the StepLib, but steps are presented only with their latest version
  - `minimal`:  contains all meta information about the StepLib, but only step-ids are presented

Previously there was no specific command to access the spec file - *`stepman steup` command's `--copy-spec-json` flag was used to access the spec, but there was no control over the spec content*.

## New Steps ✨

- __change-value 1.0.1__
- __set-xcode-plist-value 1.0.0__
- __file-downloader 0.9.1__
- __version-pre-release-info 1.0.1__

## Step updates 🛠

- __xamarin-ios-test 1.0.2__
  - `simulator_os_version` got default value: `latest`
- __script 1.1.1__
  - `content` input default value updates
- __ruby-script 2.1.0__
  - doesn't write any file into the current working directory anymore
  - better default input values
  - step.yml revision
- __cocoapods-install 1.5.2__
  - __deprecated inputs__: `is_update_cocoapods`, `install_cocoapods_version`
  - CocoaPods version is determined based on the Gemfile.lock or the Podfile.lock in the Podfile's directory
  - install gem with "--no-document" flag
- __xamarin-builder 1.3.4__
  - fixed generated ipa name
  - latest archive path fix
  - project type guide fixes
- __deploy-to-bitrise-io 1.2.4__
  - android apk infos fix
  - pass ipa_export_method in ipa_info
  - step description - a bit more info about artifacts
- __nuget-restore 0.9.2__
  - __new input__ : nuget_version - Specify this input if you would like to use a custom NuGet version
- __react-native-bundle 0.1.2__
  - allows specifying entry file
  - input renamed: `entryFile` -> `entry_file`
- __xcode-archive 1.8.3__
  - __new input__ : `use_deprecated_export` - allow to use deprecated export method
  - more info about the format of the Code Sign Identity
  - more env unset - for no applicable device found fix
  - step ensures if xcarchive generated after archive command
- __amazon-s3-upload 3.1.3__
  - hide secure inputs in log
  - missing print_failed_message fix
- __xamarin-test-cloud-for-calabash-ios 0.9.3__
  - added ios project type tag
- __project-scanner 0.9.7__
  - blacklist Podfile and project files in frameworks
  - added Script step to generated workflows
  - Podfile fixes
  - step version updates
- __sign-apk 0.9.8__
  - __deprecated input__ : jarsigner_options - jarsigner options are detected from the keystore
  - auto-detect sign algorithm and digest algorithm based on the keystore
  - fixed signing files remove
  - fixed sign command
