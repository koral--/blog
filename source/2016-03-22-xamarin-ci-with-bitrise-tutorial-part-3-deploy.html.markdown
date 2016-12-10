---
title: Xamarin CI with Bitrise Tutorial part 3 - Deploy
date: 2016-03-22 13:54 UTC
tags: xamarin, tutorial
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

There are plenty of ways to deploy your iOS, Android, or Xamarin applications from [Bitrise](https://bitrise.io) to any service of your wish. Let me show you what your options are today, if you would like to deliver your apps to your favorite testers, dearest customers, or the iTunes Connect/Google Play directly.

Although this article is part of the tutorial series dedicated to the topic of working with Bitrise as CI for Xamarin apps,  deployment is 99% the same as in case of native apps, so you can read on with confidence either way.

If you are just about moving to Bitrise with your Xamarin apps, check out the [first part of this tutorial about how to get started](http://blog.bitrise.io/2016/02/29/xamarin-ci-with-bitrise-tutorial-part-1-getting-started.html), or go for the [second part](http://blog.bitrise.io/2016/03/05/xamarin-ci-with-bitrise-tutorial-part-2-testing.html) for testing essentials.

## Archive that app! 📦

The first step of deployment to build something to be deployed. You can create archives for your apps with adding the proper steps to your workflow. It's [`Xcode Archive`](https://github.com/bitrise-io/steps-xcode-archive) for iOS, and a simple [`Gradle runner`](https://github.com/bitrise-io/steps-gradle-runner) for Android.

### Xamarin apps

When you're building a Xamarin app on Bitrise, you'll definitely have a [`Xamarin builder`](https://github.com/bitrise-steplib/steps-xamarin-builder) step in your workflow, it's part of the generated one by default. Bitrise detects and parses your configuration file, so it'll set handy environment variables based on it.

![Xamarin Builder step](xamarin_builder_editor.png)

If your configuration has a _real device_ as platform set, the step will archive your apps after building them automatically. There is no need to add an extra Xcode archive, or Gradle step.

![App environment variables](app_env_vars.png)

> You are able to add any kind of step after the `Xamarin builder` as you would after an `Xcode archive`, or `Gradle runner` in case of native iOS/Android apps. It's possible because Bitrise generates the same output from the Xamarin builder step as it does from the native archivers. This way your workflow becomes **compatible with all Bitrise integrations for iOS and Android** after building your app.

## General artifact deployment 🚀

There are a lot of cases when you don't need any extra service in your flow, or your apps don't have tools like crash reporting integrated yet, or you're just not in the phase of submitting to a production yet.

There are some general options available on Bitrise for you then, like our very own deployment service.

### Bitrise

I'm pretty sure the [`Deploy to bitrise.io`](https://github.com/bitrise-io/steps-deploy-to-bitrise-io) step looks familiar, since everyone has it in their workflows by default, when adding a new app. It uploads the file, or directory found at `$BITRISE_DEPLOY_DIR` and sends an email to the specified group (everyone on the team by default). Read more about the [available environment variables on our dev center](http://devcenter.bitrise.io/faq/available-environment-variables/).

![Deploy to Bitrise step](deploy_to_bitrise_step.png)

> The `$BITRISE_DEPLOY_DIR` environment variable is the one every step that produces an archived app has as output. You are able to just drop the steps in and wait for the results without any additional configuration.

### Amazon S3

If you'd like to upload your build artifacts to [Amazon S3](https://aws.amazon.com/s3/), you need to add the [`Deploy to Amazon S3`](https://github.com/bitrise-io/steps-amazon-s3-deploy) step to your workflow. After passing your access keys and bucket name to the  step, you can specify a bunch of things, like the access level of the file to upload, its path in your bucket, etc.

## Integrated third-party services

Most of these third-parties has a dedicated iOS, and an Android step on Bitrise. You can use them by simply adding them to your workflow. Check out all the services you can add this easy at our [integrations page](https://www.bitrise.io/integrations).

> Don't forget: you can always add a Script step and install, or run anything you want, but there's no step for it yet. If you feel like contributing, [turn your script into a Bitrise build step](https://github.com/bitrise-io/bitrise-contrib/blob/master/README.md) and earn a 50% discount from our [pro plan with 1 concurrency](https://www.bitrise.io/pricing).

### iTunes Connect

You can send your iOS apps to [iTunes Connect](https://itunesconnect.apple.com) via Bitrise with [deliver](https://github.com/fastlane/fastlane/tree/master/deliver), or [Shenzen](https://github.com/nomad/shenzhen).

#### deliver 🚚

This gem is part of the [fastlane](https://github.com/fastlane) family. You can upload hundreds of localized screenshots, and your app to iTunes Connect from Bitrise, with `deliver`, using the [`Deploy to iTunes Connect (with deliver)`](https://github.com/bitrise-io/steps-deploy-to-itunesconnect-deliver) step.

You'll have to set your Apple ID email address, your iTunes Connect credentials, and the app's ID to get started. You can specify whether to submit for TestFlight testing, skip screenshots, or metadata optionally.

![Deploy to iTunes Connect with deliver](deliver_step_edit.png)

#### Shenzen

Type in your Apple ID address and your iTunes Connect credentials into the [`Deploy to iTunes Connect (with Shenzen)`](https://github.com/bitrise-io/steps-deploy-to-itunesconnect-shenzhen) step in the workflow editor and just press build to upload your app.

> Please note, that you are able to create separate workflows for the same app and [specify trigger maps](http://devcenter.bitrise.io/webhooks/trigger-map/) to manage different scenarios when building app for development, staging, or production.

### Google Play

Upload your Android apps to Google Play with the [`Google Play deploy`](https://github.com/bitrise-steplib/steps-google-play-deploy) step.

Add your first `apk` to the [Google Play manually](https://play.google.com/apps/publish), link your [developer console to an API project](https://developers.google.com/android-publisher/getting_started). Set up API access clients, with a service account of a key type `p12`. Grant the necessary access to the service account.

Specify the service account email address at the Bitrise `Google Play deploy` step, your app's package name, the path of your service account's `.p12` key and a track, `alpha`, `beta`, `production`, or `rollout`.

### Fabric

You are able to use [Fabric](https://get.fabric.io/)'s distribution services for iOS with the [`Fabric/Crashlytics deployer`](https://github.com/bitrise-io/steps-fabric-crashlytics-beta-deploy) step. After you've specified your API key and build secret, you are ready to roll. You can specify release notes, email addresses, or groups to send the notifications about new builds to.

### HockeyApp 🏒

You can add [HockeyApp](http://hockeyapp.net/) for iOS, or Android to your workflow with the [HockeyApp iOS](https://github.com/bitrise-io/steps-hockeyapp-deploy), or [HockeyApp Android Deploy](https://github.com/bitrise-steplib/steps-hockeyapp-android-deploy) steps. The only required field is your API token, and you can specify a Hockey app ID instead of a bundle ID to identify apps. This way you can make sure not to generate a new app on Hockey if you already have one for the given project. It's possible to add release notes, manage notification settings, add tags, specify git commit hash, etc.

### Appaloosa

Distribute your apps with [Appaloosa](https://www.appaloosa-store.com/) by sending your archived apps with Bitrise to the Appaloosa Store. Fear not, if you don't have an Appaloosa account yet, you can add an email address in the [`Publish to Appaloosa Store`](https://github.com/appaloosa-store/bitrise_appalossa) step to receive an email with the link to access your private store.

![Appaloosa step inputs](appaloosa_step_inputs.png)

If you already registered, specify an API key, a store ID to upload your app to. Add screenshots, and a description about your new version optionally. You can also specify groups to send your app to.

### TestFairy ✨

Record your videos and deliver your apps to your testers with [TestFairy](https://testfairy.com/) from Bitrise, using the [TestFairy Deploy step for iOS](https://github.com/bitrise-io/steps-testfairy-deploy), or [Android](https://github.com/rudacs/bitrise-steps-testfairy-deploy-android). Add your API key, and configure your step with tester groups, notifications, or video recording amongst others.

### Applivery

Distribute your apps through [Applivery](http://www.applivery.com/) right away from your CI workflow with the [Applivery.com iOS](https://github.com/applivery/steps-applivery-ios-deploy) & [Android Deploy](https://github.com/applivery/steps-applivery-android-deploy) steps. Set your Applivery account API Key and app ID in the workflow editor to get started. Attach notes, add tags, or modify notification settings any time.

## Anything else?

You can always share your questions, issues, compliments, or virtual hugs with us on [Twitter](https://twitter.com/bitrise), by [email](mailto:letsconnect@bitrise.io), or on our [public Slack](chat.bitrise.io).

If you are attending the [Xamarin EVOLVE conference](https://evolve.xamarin.com/) in April, make sure to come by to our booth for a chat! 👋
