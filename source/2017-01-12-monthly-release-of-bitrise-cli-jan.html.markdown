---
title: Monthly release of Bitrise CLI tools and summary of updates (Jan)
date: 2017-01-12 11:46 UTC
tags: announcement, CLI
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI ([1.5.2](https://github.com/bitrise-io/bitrise/releases/tag/1.5.2))

Our frontend team is working on the offline bitrise configuration (bitrise.yml) [editor](https://github.com/bitrise-io/bitrise-workflow-editor), to allow our users manage the config locally.
This tool uses the [bitrise-cli](https://github.com/bitrise-io/bitrise) to load and save the config and the secrets files. To allow the editor to work with proper bitrise.yml we extended the bitrise config validation process. For more information & discussion join as at [discuss.bitrise.io/t/offline-workflow-editor/39](https://discuss.bitrise.io/t/offline-workflow-editor/39).

bitrise-cli from now __validates__ whether the workflows referenced in the `trigger_map` exists, and also __checks for duplicate patterns with same type__ (in which case the second pattern would never be used).

Also an important point is to represent the bitrise.yml as simply as possible, this led us to update our config related models, to do not save empty structs to the bitrise.yml, when the config model is serialized and saved as a file.
For example step's `source` and `deps` properties where saved as an empty struct (when these properties were empty) to the bitrise.yml, instead of omitting this options. This is an important improvement for tool developers, who build their tools around the Bitrise CLI (like the [new, open source workflow editor (beta)](https://discuss.bitrise.io/t/offline-workflow-editor/39))

From now you will not get generated results like this:

<pre><code>...
workflows:
  ci:
    steps:
    - slack:
        inputs:
        ...
        source: {}
        deps: {}
...</code></pre>

`source` and `deps` in this case will simply be omitted.

We also made minor changes in envman, to let the new bitrise-cli to use this updates, we updated the required envman version to 1.1.3.

### New version of Envman ([1.1.3](https://github.com/bitrise-io/envman/releases/tag/1.1.3))

envman used `EnvsYMLModel` to store the environment list, since the offline workflow editor works with both json and yml models as well, we renamed this model to `EnvsSerializeModel` to better represent, that it can be stored even as yml or json struct.

Also `EnvsSerializeModel` got a `Normalize` function to make the environment list json serializable, even if it was created with yml parser.

### New project scanner ([0.12.0](https://github.com/bitrise-steplib/steps-project-scanner/releases/tag/0.12.0)) released.

The project scanner uses a shared [bitrise-init](https://github.com/bitrise-core/bitrise-init) package, which is used to auto-generate a bitrise config (bitrise.yml) by scanning the project.

The new version includes several updates:

__android packages update scipt__

`extra-android-support` update removed from the script, since it is removed from the google repositories.

__cocoapods project-workspace mapping fixes__

The scanner now handles properly the `Podfile` even if a custom project or workspace is defined in the `Podfile`.

__macos support__

The scanner now detects the macOS project type and creates the base workflow for you.

__shared scheme link fix__

If your iOS/macOS project does not contain any shared schemes, the step notifies you and the fix link will point to the correct url on our [devcenter](http://devcenter.bitrise.io/ios/frequent-ios-issues/#xcode-scheme-not-found).

__warn if xcshareddata is gitignored__

If your shared schemes are gitignored the scanner will notify you about it.

## New Steps

- __Raygun 1.0.1__

## Step updates

- __ipa-info 1.0.1:__
  - Check for non-empty
- __install-react-native 0.9.1:__
  - added android, ios project_type_tags
- __react-native-bundle 1.0.2:__
  - added android, ios project_type_tags
- __deploy-to-itunesconnect-deliver 2.8.0:__
  - implement missing team args
  - added macos project_type_tag
  - deliver fastlane fix: using `fastlane deliver ..` instead of `deliver ..`
  - installing / updating the fastlane gem instead of the deliver gem
- __carthage 3.0.3:__
  - added macos project_type_tag
  - typo fixes
- __set-xcode-build-number 1.0.5:__
  - macos project_type_tag added
- __xcode-analyze 1.6.1:__
  - macos project_type_tag added
- __xcode-test-mac 1.0.6:__
  - macos project_type_tag added
- __cocoapods-install 1.6.0:__
  - macos project_type_tag added
  - Switched the priority; previously if both Gemfile.lock and Podfile.lock were in the repo Gemfile.lock won and the CocoaPods version defined in Gemfile.lock was used. Now Podfile.lock wins, and Gemfile.lock is only a fallback.
- __export-xcarchive 0.9.2:__
  - removed rvm fix
- __project-scanner 0.12.0:__
  - read more in __New project scanner ([0.12.0](https://github.com/bitrise-steplib/steps-project-scanner/releases/tag/0.12.0)) released__ section
- __recreate-user-schemes 0.9.5:__
  - macos project type tag added
- __xcode-archive-mac 1.3.3:__
  - macos project type tag added
- __certificate-and-profile-installer 1.8.2:__
  - macos project_type_tag added
- __export-xcarchive-mac 0.9.2:__
  - removed rvm fix
  - macos project_type_tag added
- __deploy-to-bitrise-io 1.2.6:__
  - Reamde.md, bitrise.yml and step.yml updates
- __xamarin-archive 1.2.0:__
  - Fixes a time format parsing bug - more info: http://discuss.bitrise.io/t/xamarin-archive-step-fix-failed-to-collect-output-error-failed-to-parse-xcrachive-file-name-1-01-17-2-51-am-with-layout-01-02-06-3-04-pm-error-parsing-time-1-01-17-2-51-am-month-out-of-range/54
  - Typo fix (thanks @CayasSoftware !), and linter issue fix
  - omit scanning project type, which does not generate app archive
  - step.yml type tag fix
  - README update - how to use
- __xamarin-test-cloud-for-ios 2.1.1:__
  - go-xamarin update for xcarchive time format layout fix
- __apk-info 1.2.0:__
  - Better way to get Android icon, 1.2.0
  - Getting better icon version
- __applivery-ios 0.2.1:__
  - Added support for autoremove param that automatically removes the oldest build before uploading a new one to prevent reaching account limits. By default it's set to true for any automatic deployment system.
- __applivery-android 0.2.1:__
  - Added support for autoremove param that automatically removes the oldest build before uploading a new one to prevent reaching account limits. By default it's set to true for any automatic deployment system.
- __hockeyapp-deploy 2.4.0:__
  - go-toolkit support
  - retry request if fails
- __set-ios-info-plist-unified 1.1.4:__
  - Update version to share to 1.1.4

_Join the discussion at: [discuss.bitrise.io/t/monthly-release-of-bitrise-cli-tools-and-summary-of-updates-jan](https://discuss.bitrise.io/t/monthly-release-of-bitrise-cli-tools-and-summary-of-updates-jan/247)_
