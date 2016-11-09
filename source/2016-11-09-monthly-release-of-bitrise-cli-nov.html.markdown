---
title: Monthly release of Bitrise CLI (Nov)
date: 2016-11-09 10:10 UTC
tags: announcement, CLI
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

> We ship a new bitrise cli version on the second Tuesday of every month.
> The new release will be available on the [bitrise.io](https://www.bitrise.io)
> virtual machines on the weekend after the CLI release,
> unless we discover any serious bug / regression.

Read on to learn more about this month's [Bitrise CLI](https://github.com/bitrise-io/bitrise) release and about the changes around bitrise tools and steps.

## New version of Bitrise CLI (1.4.4)

### Apt-Get package install fix

Previous `bitrise-cli` versions used `dpkg -l PACKAGE` to check whether the step dependency (_managed by apt-get_) is installed already. This command returns with exist code: `0`, even if the package is not fully installed.

This version of `bitrise-cli` uses `dpkg -s PACKAGE` command to check if the package is installed, which returns with a proper exit code.

### Improved `bitrise version` command

`bitrise version --full` command now prints the __Go__ and __OS__ version, which was used to build the bitrise-cli binary. These new information are useful to address issues with `bitrise-cli` distributions.

The current binary's version looks like this (_on mac_):

```
version: 1.4.4
format version: 1.3.1
os: darwin (amd64)
go: go1.7.3
build number: 1441
commit: 10d07d4a22acf83417ff56421558b46dc7db7938
```

### New command for plugin handling

bitrise-cli's plugin command group already contained `install`, `delete` and `list` commands.

Since the previous version, we've improved the analytics plugin, which sends anonymous usage informations about step run results.

During the development we've really been missing an `update` command for plugins, so this version of `bitrise-cli` now got that.

Run `bitrise update PLUGIN_NAME` to update (_an already installed plugin_) to the __latest version__.

### Step dependency install improvements

In [version 1.4.0](https://github.com/bitrise-io/bitrise/releases/tag/1.4.0) we've added __retry__ logic to networking functions (_like plugin install or bitrise-tool install_). In this new version we kept improving reliability by adding retry logic to __step dependency install__ as well.

### Dependency updates

* `envman` minimum version updated to: [1.1.2](https://github.com/bitrise-io/envman/releases/tag/1.1.2)
* `analytics` plugin version updated to: [0.9.6](https://github.com/bitrise-core/bitrise-plugins-analytics/releases/tag/0.9.6)

### New version of Envman (1.1.2)

New field added to envman's environment item model: `category`.

This new property will be used on the Bitrise website, to __group inputs__, like: `required`, `code-sign`, `xcodebuild-configs`, ...

## New Steps

* __giphy__
* __xamarin-archive 1.1.1__
* __export-xcarchive 0.9.0__
* __export-xcarchive-mac 0.9.0__
* __apk-info 1.1.1__
* __xcode-test-bundle-builder 0.0.4__
* __yarn 0.0.3__
* __monkop-android 1.0.1__

## Step updates 🛠

* __xcode-test 1.17.1:__
  * `step.yml` updates
* __project-scanner 0.11.1:__
  * add `xcode-test` step to iOS `deploy` workflow as well
  * logging updates
  * dependency update
  * bump __format version__ to 1.3.1
  * use `xamarin-archive` step instead of xamarin-builder
  * step version updates
* __appaloosa 1.2.3__
* __sign-apk 1.1.1:__
  * using apk only if signing files found (META-INF/.dsa, META-INF/.rsa)
* __post-jira-comment-with-build-details 0.1.9__
* __xamarin-test-cloud-for-android 2.1.0:__
  * go toolkit support
  * use [go-xamarin]() packages, [blogpost](http://blog.bitrise.io/2016/10/18/the-new-xamarin-archive-step.html)
* __xamarin-test-cloud-for-ios 2.1.0:__
  * go toolkit support
  * use [go-xamarin]() packages, [blogpost](http://blog.bitrise.io/2016/10/18/the-new-xamarin-archive-step.html)
* __nunit-runner 1.0.0:__
  * go toolkit support
  * use [go-xamarin]() packages, [blogpost](http://blog.bitrise.io/2016/10/18/the-new-xamarin-archive-step.html)
  * Mention NUnit 3 only support thanks for **@timotei**
  * NUnit test and Console Runner clarifications
* __xamarin-ios-test 2.1.0:__
  * go toolkit support
  * use [go-xamarin]() packages, [blogpost](http://blog.bitrise.io/2016/10/18/the-new-xamarin-archive-step.html)
* __nuget-restore 1.0.1:__
  * go-toolkit support
  * Nuget download url fix
  * typo fix
* __gradle-unit-test 1.0.1:__
  * __NEW INPUT:__ `gradle_file` - Path to the Gradle file to use
  * go-toolkit support
  * removed unused `workdir` input
* __resign-ipa 1.2.0:__
  * Support for resigning apps in Swift
  * Fix for relative path issues
* __google-play-deploy 1.0.0:__
  * __DEPRECATED INPUT:__ `service_account_email` - Use JSON key instead of P12 key and `service_account_json_key_path` input.
  * __DEPRECATED INPUT:__ `key_file_path` - Use JSON key instead of P12 key and `service_account_json_key_path` input.
  * __NEW INPUT:__ `service_account_json_key_path` - Path to the Service Account's JSON key file.
  * __NEW INPUT:__ `user_fraction` - Portion of the users who should get the staged rollout version of the APK.
  * upload multiple APKs in a single edit, fix for: https://github.com/bitrise-steplib/steps-google-play-deploy/issues/7
  * go-toolkit
* __certificate-and-profile-installer 1.8.1:__
  * `security` command Sierra fix, related issue: https://github.com/bitrise-io/steps-certificate-and-profile-installer/issues/20
  * printable profile infos fix
  * check keychain path with `-db` suffix as well
  * Sierra keychain prompt fix, [openradar](https://openradar.appspot.com/28524119)
* __calabash-ios-uitest 1.1.0:__
  * allow to specify latest for `simulator_os_version`
  * __NEW INPUT:__ `calabash_cucumber_version` - calabash-cucumber gem version to use.
  * __NEW INPUT:__ `gem_file_path` - Path to the Gemfile which contains calabash-cucumber gem.
  * go-toolkit
  * logging updates
  * export BITRISE_XAMARIN_TEST_RESULT success
  * gem install cmd fix
* __calabash-android-uitest 1.0.0:__
  * go-toolkit support
* __xcode-archive-mac 1.3.2:__
  * output file export log fix
* __fabric-crashlytics-beta-deploy 2.2.1:__
  * Merge pull request #15 from zittix/fix_dsym
  * Fixed upload-symbols binary (was the one from Crashlytics framework instead of Fabric.app app)
  * Fix: Updated submit and upload-symbols to latest version
* __git-clone 3.4.1:__
  * go-toolkit support
