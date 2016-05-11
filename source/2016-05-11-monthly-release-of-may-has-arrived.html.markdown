---
title: Monthly release of May has arrived
date: 2016-05-11 12:32 UTC
tags: announcement
authors: Krisztián Gödrei|krisztian.godrei@bitrise.io
---

In this blogpost you can learn more about the `bitrise cli` release and about the changes around `bitrise tools and steps`.

## New version of bitrise CLI (1.3.4)

In the new version we've removed the steps' nasty, confusing log, which appeared sometimes when a step failed:

```
ERRO[13:14:02] Step (tmp) failed, error: (exit status 1)
```

*This appeared when the failed step passed exit status error message (exit status X) back to bitrise CLI. Now the exit status error will not be printed.*

☀️ No need to worry about this anymore.

Most changes of v1.3.4 contain stability improvements, the most relevant is the `trigger map validation`, which makes sure your trigger map does not contain trigger map item with empty pattern or workflow ID. Safety check ✅

### New release of stepman (0.9.19)

Stepman became a new version command: `stepman version`. Using the `--full` flag, the output will also contain the build number and commit hash of the version as well.  
step-template link fixed in v0.9.19 and contains minor bug fixes.

## New Steps & Step updates

- cocoapods-install `1.2.0  `
- fauxpasapp `0.1.3`
- email-with-mailgun `2.1.0`
- xcode-test `1.13.7`
- sign-apk `0.9.6`
- ftp-upload `2.0.1`
- cahce-pull `0.9.1`
- deploy-to-bitrise-io `1.2.3`
- certificate-and-profile-installer `1.4.2`
- cache-push `0.9.3`
- post-jira-comment-with-build-details `0.1.4`
- applivery-android `0.2.0`
- applivery-ios `0.2.0`
- codecov `1.0.1`
- set-ios-bundle-identifier `1.0.2`
- create-install-page-qr-code `0.1.0`
- google-play-deploy `0.9.2`
- change-workdir `1.0.1`
- deploy-to-itunesconnect-deliver `2.5.0`
- xcode-project-info `2.0.0`
- xcode-archive `1.7.2`
- web-translate-it `1.0.1`
- set-nuget-private-source `1.0.1`
- carthage `2.1.0`
- cocoaseeds-install `1.0.0`
- xamarin-builder `1.1.4`
- xamarin-user-management `1.0.2`
- start-android-emulator `1.0.2`
