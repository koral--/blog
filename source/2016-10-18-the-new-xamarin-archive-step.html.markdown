---
title: The new Xamarin Archive step
date: 2016-10-18 13:09 UTC
tags: announcement, step-update, xamarin-dev
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

## New shared Xamarin Builder tool

Since Xamarin Studio 6 has been around, we've spotted an annoying __hanging issue__ with `mdtool` (one of Xamarin's build tools), which is used by Bitrise's shared [xamarin-builder](https://github.com/bitrise-io/xamarin-builder) tool.
This tool is the ❤️ of our Xamarin steps (_xamarin-builder_, _xamarin-test-cloud-for-ios_, _xamarin-test-cloud-for-android_, ...). It's used to analyze and build the Xamarin projects, then export the generated outputs.  
`xamarin-builder` uses `mdtool` for archiving `iOS`, `tvOS` and `macOS` project types (for android project it uses `xbuild`).

The hanging issue first appeared at the `Loading Projects...` part of the `mdtool` build process in some of the builds.
To solve this issue the step aborted the process and reran the build command, which solved this issue.

When Xamarin released the `Xamarin.iOS 10` framework, we received a lot of reports about hanging on different parts of the `mdtool` build process.

Others also requested to add support for `xbuild` (the other Xamarin build tool) for archiving `iOS`, `tvOS` and `macOS` project types.

These issues and requests lead us to release a new version of the shared `xamarin-builder` tool and update the Xamarin steps.

The new builder tool is part of our [go-xamarin](https://github.com/bitrise-tools/go-xamarin) project, which is a collection of packages for serving our Xamarin steps.

The main packages:

- __analyzers__: Parses Xamarin Solutions and Projects.
- __tools__: A collection of easy-to-use Xamarin tool wrappers (`buildtools/mdtool`, `buildtools/xbuild`, `nunit` and `testcloud`).
- __builder__: This package contains a Model which is able to archive Xamarin projects or run tests.

## The new Xamarin Archive step

The `xamarin-builder` step was used to build Xamarin projcts on Bitrise. As it uses the old xamarin-builder tool, the `iOS`, `tvOS` and `macOS` project types were built with `mdtool`.
The step generates the `.xcarchive` with mdtool and it exported the archive - into an `.ipa` file for `iOS` and `tvOS`, or into an `.app`/`.pkg` for `macOS` projects.

It uses the `export_options_path` and `export_method` inputs to control the generated output's type (`development`, `app-store`, `ad-hoc` or `developer-id`), but the step applied the export option to every `.xcarchive` file, which may have generated problems with the outputs.

For example, if the project contained macOS and iOS projects and the `export_method` was set to: `developer-id`,  
it exported the correct .app file from the macOS `xcarchive`, but failed when it tried to export the iOS `xcarchive` (`developer-id` is not a valid export type for iOS projects).

Another issue with this step is related to the output environments; it exports `BITRISE_IPA_PATH` for the generated .ipa,  
but if the project contains both `tvOS` and `iOS` project types (both generates `.ipa` file), it was not clear which one would be exported in `BITRISE_IPA_PATH`.

Some of you have requested to enable custom options for the build commands used by the step.

These issues and feature requests made us to release a new step and not a new version of `xamarin-builder`.

📦 The new step is: __[xamarin-archive](https://github.com/bitrise-steplib/steps-xamarin-archive)__

Main features:

- __By default it uses `xbuild` for building `iOS`, `tvOS` and `macOS` project types.__  
  `xbuild` eliminates the hanging issue and it can be forced to generate both `xcarchive` and `ipa` files,  
  so the step doesn't need to handle the ipa/app/pkg export process.
  _The step contains an option to switch back to `mdtool`, see: `force_mdtool` input._

- __It exports different project type outputs to different environment variables.__  
  The `ipa` file will be exported into:

  - `BITRISE_IPA_PATH` if the project type is `iOS`
  - `BITRISE_TVOS_IPA_PATH` if the project type is `tvOS`  

  See the full output list in the [step.yml](https://github.com/bitrise-steplib/steps-xamarin-archive/blob/master/step.yml#L93)

- __It allows customization of the generated build commands:__  
  Use `android_build_command_custom_options` to append custom options to the command generated for building the Android project.  
  Use `ios_build_command_custom_options` to append custom options to the command generated for building the iOS project.  
  Use `tvos_build_command_custom_options` to append custom options to the command generated for building the tvOS project.  
  Use `macos_build_command_custom_options` to append custom options to the command generated for building the macOS project.

The step exports the following outputs for `xbuild` build tool:

- for `Android` projects: `BITRISE_APK_PATH`
- for `iOS` projects: `BITRISE_XCARCHIVE_PATH`, `BITRISE_IPA_PATH` and `BITRISE_DSYM_PATH`
- for `tvOS` projects: `BITRISE_TVOS_XCARCHIVE_PATH`, `BITRISE_TVOS_IPA_PATH` and `BITRISE_TVOS_DSYM_PATH`
- for `macOS` projects: `BITRISE_MACOS_APP_PATH` and `BITRISE_MACOS_PKG_PATH` (_NOTE: xbuild does not generate xcarchive for macOS projects._)

The step exports the following outputs for `mdtool` build tool:

- for `Android` projects: `BITRISE_APK_PATH`
- for `iOS` projects: `BITRISE_XCARCHIVE_PATH`, `BITRISE_IPA_PATH` and `BITRISE_DSYM_PATH`
- for `tvOS` projects: `BITRISE_TVOS_XCARCHIVE_PATH`, `BITRISE_TVOS_IPA_PATH` and `BITRISE_TVOS_DSYM_PATH`
- for `macOS` projects: `BITRISE_MACOS_XCARCHIVE_PATH`, `BITRISE_MACOS_APP_PATH` and `BITRISE_MACOS_PKG_PATH`

The archive export process is handled by the build tools (`xbuild` or `mdtool`), based on the project settings.

## Export the generated `xcarchive`

The new xamarin-archive step generates 'final outputs' (`ipa`, `dsym`, `app` and `pkg`) signed based on the project settings,  
and also generates the 'raw' `xcarchive` file.  

Instead of keeping the custom (not based on the project settings) archive export functionality in the `xamarin-archive` step, we decided to create new steps for exporting the xcarchive.  
This is especially useful if you want to generate multiple 'final outputs' in the same workflow and build only once.  
Also the new steps let you use all of Xcode's new export options.  

__For `iOS` and `tvOS` project archives, the step is: [export-xcarchive](https://github.com/bitrise-steplib/steps-export-xcarchive)__

It requires the xcarchive path (`archive_path` input with default value: `$BITRISE_XCARCHIVE_PATH`, the `xamarin-archive` step's xcarchive output for iOS projects).

You can specify the export type with one of the following inputs:

- `export_method` input:  
  Specify the export method to use in the export options plist file, or set to `auto-detect` (default value) to use the method specified by the embedded profile in the archive.
- `custom_export_options_plist_content` input:  
  Specifies a custom export options plist content that configures archive exporting.
- `use_legacy_export` input:  
  Set this input to true if you want to use the old .ipa export method (this option can solve the ominous `Code=14 "No applicable devices found."` issue)

__For `macOS` project archives, use the [export-xcarchive-mac](https://github.com/bitrise-steplib/steps-export-xcarchive-mac) step.__

It has similar capabilities to the previous step, see the [step.yml](https://github.com/bitrise-steplib/steps-export-xcarchive-mac/blob/master/step.yml) for more details.

## The old xamarin-builder step

This step will not be removed from the StepLib, but it will be marked as deprecated and we will not maintain it any longer.  
We recommended you to migrate to the new `xamarin-archive` step by:

- replacing your `xamarin-builder` step with `xamarin-archive` step,
- filling the new step's inputs
- if you used the `xamarin-builder` step's custom export options (`export_options_path` or `export_method`):  
  set the desired code signing in your project, or let the `xamarin-archive` step generate the outputs based on the project settings,
- add `export-xcarchive`/`export-xcarchive-mac` step to custom export the generated xcarchive (by xamarin-archive step).
