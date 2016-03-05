---
title: Xamarin CI with Bitrise Tutorial Part 2 - Testing
date: 2016-03-05 10:44 UTC
tags: xamarin, tutorial
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

We recently released support for Xamarin iOS and Android apps on [Bitrise](https://bitrise.io). If you are just about moving to Bitrise with your Xamarin apps, check out the [first part of this tutorial about how to get started](http://blog.bitrise.io/2016/02/29/xamarin-ci-with-bitrise-tutorial-part-1-getting-started.html).

This tutorial is about how to test your apps on Bitrise, from running basic [NUnit](http://www.nunit.org/) tests, through [UITest](https://developer.xamarin.com/guides/testcloud/uitest/) and [Calabash](https://developer.xamarin.com/guides/testcloud/calabash/introduction-to-calabash/), to using the [Xamarin Test Cloud](https://xamarin.com/test-cloud).

## Restore packages

Before doing any building, or testing, you will have to restore your packages your project is depending on. To help you achieve this, we implemented a `NuGet restore` and a `Xamarin Components restore` step.

![NuGet restore step](xamarin_nuget_restore.png)

There is not much to do here, Bitrise already recognized your solution file's path during your app's setup and saved it to an environment variable. This `$BITRISE_PROJECT_PATH` variable will be the default input value for these steps.

Make sure to place every package restore step after the `Git clone repository` step and before any build step!

> If you'd like to install NuGet packages with custom versions, please check out our [related guide in the Bitrise Dev Center](http://devcenter.bitrise.io/docs/nuget-restore-with-custom-nuget-version).  

### Custom NuGet packages

If you have custom NuGet packages to restore, add a generic `Script` step to your workflow and paste this line of bash into it.

```bash
#!/bin/bash

nuget sources add -Name ${NAME_FOR_SOURCE} -Source ${SOURCE_URL}
```

Make sure to place this step before `NuGet restore`.

## NUnit tests

If your project contains NUnit tests, the only thing you have to do is to add the [`NUnit Runner` step](https://github.com/bitrise-steplib/steps-nunit-runner/blob/master/step.yml) to your app's workflow.

![Add NUnit runner step](xamarin_add_nunit_runner.png)

Its default inputs are pre-set, but can be modified. These are the paths to your solution file, your configuration and the platform of your NUnit tests to run.  You are able to add extra options through the `NUnit command options`.

![NUnit runner step config](xamarin_nunit_runner.png)

> You can always check out what **inputs**, **outputs** and **logic** a Bitrise step has. There's a button pointing to the source of the selected step in the workflow editor of your apps. Check out all the steps we have on [our integrations page](https://www.bitrise.io/integrations), or their implementation at the [Bitrise StepLib repository](https://github.com/bitrise-steplib).

## UI tests

For adding UI tests, you will have to modify your project a bit. It's a temporary solution until we figure out a better way. Let us know if you have a suggestion!

>  Use the `NUnit Test Runner step` for running .NET UI tests.

### iOS

In case of an iOS app, you'll have to expose the app's bundle ID and the simulator's UDID in your app configuration. We are going to export the simulator UDID for you as environment variable, so it should look like the following.

```c#
  [SetUp]
    public void BeforeEachTest()
    {
        string deviceUDID = Environment.GetEnvironmentVariable("IOS_SIMULATOR_UDID");
        string bundleID = "your.applications.bundle.id";

      ConfigureApp
          .iOS
          .InstalledApp(bundleID)
          .DeviceIdentifier(deviceUDID)
          .StartApp();
    }
```
If you finished updating your project with the above code, just add the `Xamarin iOS Test` step to your workflow to make it part of your build process.

### Android

If you'd like to UI test Android apps, you'll have to update your configuration code to contain the emulator and bundle IDs.

It's strongly recommended to add some extra waiting time to deal with Android [emulator launching issues](http://forums.xamarin.com/discussion/27438/xamarin-ui-test-android-timed-out).

```c#
 // Android emulators are slow, give some time for test.
    public class WaitTimes : IWaitTimes
    {
        public TimeSpan GestureWaitTimeout
        {
	        get { return TimeSpan.FromMinutes(5); }
        }
        public TimeSpan WaitForTimeout
        {
            get { return TimeSpan.FromMinutes(5); }
        }
    }

    // ...

    [SetUp]
    public void BeforeEachTest()
    {
        // steps-xamarin-android-test exports the generated APK path.
        string apkPath = Environment.GetEnvironmentVariable ("ANDROID_APK_PATH");
        string emulatorSerial = Environment.GetEnvironmentVariable("ANDROID_EMULATOR_SERIAL");

        ConfigureApp.Android
          .ApkFile(apkPath)
          .DeviceSerial(emulatorSerial)
          .WaitTimes(new WaitTimes())
          .StartApp();
    }
```

Now you just have to add the `Xamarin Android Test` step to your workflow.

## Calabash

If you'd like to run your native tests with Calabash on Bitrise, look for the Calabash steps when adding a new step to your workflow. You'll be able to run the tests on our VMs, and/or in the Xamarin Test Cloud.

### iOS

For running iOS UI tests with Calabash, add the [`Calabash iOS UI test`](https://github.com/bitrise-steplib/steps-calabash-ios-uitest/blob/master/step.yml) step to your workflow. Specify the OS version of the Simulator you'd like to run your tests on, and you are ready to roll.

### Android

To run your Android UI tests, you have to add the `Calabash Android UI test` step and specify the path to your `apk`. You can find it relatively via `$BITRISE_DEPLOY_DIR`.

## Xamarin Test Cloud

Using the XTC lets you run your tests on real devices. You can initiate XTC tests form Bitrise easily. You just have to pull in the `Xamarin Test Cloud for iOS` or `Xamarin Test Cloud for Android` step to get started. The following information is necessary to fill in:

* `User email` - Your Xamarin user's email address
* `API key` - Your Xamarin Test Cloud API key
* `Device selection id` - The device id you would like to use

It's possible to pass other parameters to the XTC step, please check out the step in your app's workflow editor, or the [`yml` of the step directly](https://github.com/bitrise-steplib/steps-xamarin-test-cloud-for-ios/blob/master/step.yml) for more details.

### Submit Calabash tests to Xamarin Test Cloud

For submitting your native tests with Calabash to the XTC, just add the proper steps `Submit Calabash iOS tests to XTC` or `Submit Calabash Android tests to XTC` to your workflow. There you will have to provide your email address, your API key and the desired device id as described above.

## Test results

You are going to have generated output variables after running any of the listed test steps, `BITRISE_XAMARIN_TEST_RESULT`, and `BITRISE_XAMARIN_TEST_FULL_RESULTS_TEXT`. The first one will simply tell you whether the tests succeeded, or not. The full text results will contain the whole test logs. You are able to use these values in steps followed by your test steps, [`Send a Slack message`](https://github.com/bitrise-io/steps-slack-message/blob/master/step.yml) for example.

![Send test results to Slack](xamarin_slack_results.png)

## Anything else?

You can always share your questions, problems, compliments, or virtual hugs with us on [Twitter](https://twitter.com/bitrise), by [email](mailto:letsconnect@bitrise.io), or on our [public Slack](chat.bitrise.io).

If you are attending the [Xamarin EVOLVE conference](https://evolve.xamarin.com/) in April, make sure to come by to our booth for a chat!

See you in part two about testing Xamarin apps on Bitrise and happy building in the meantime! 🤖
