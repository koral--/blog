---
title: Xamarin CI with Bitrise Tutorial Part 1 - Getting Started
date: 2016-02-29 10:26 UTC
tags: xamarin, tutorial
authors: Agnes Vasarhelyi|agnes@bitrise.io
---

[Bitrise](https://bitrise.io), *our precious* CI/CD platform is now able to build, test and distribute *your precious* [Xamarin](https://xamarin.com/) iOS/Android apps!

![Bitrise loves Xamarin](xamarin_and_bitrise_love.png)

Xamarin recently [promoted three months of Bitrise Pro](https://blog.xamarin.com/claim-your-spot-for-xamarin-ci/) plan for a limited amount of customers with some nice features besides basic CI, like Xamarin Test Cloud support and daily regression tests for the Alpha/Beta channels. This period helps us to work a bit more closely to people setting up Xamarin projects on Bitrise. Now we are here to share the journey others took to help you get started.

This first part of the tutorial series is about *why*, *how* and *what* you can do with a Xamarin project on Bitrise today and how to achieve your first green build. The next two episodes will cover testing and distribution in details.

## Just a little bit of history 🏛

[Bitrise](https://bitrise.io) started as CI/CD for iOS, we recently added Android to the collection of officially supported platforms. Our software is known as easy to use, highly customizable, and delivered with [dozens of third party integrations](https://www.bitrise.io/integrations) out of the box. Part of the reasons for flexibility is that the [runner itself](https://github.com/bitrise-io/bitrise) and all these build steps integrating third party services are [open sourced](https://github.com/bitrise-io/bitrise-steplib). Another important detail could be that we host VMs with passwordless sudo, so you can basically install anything you like with a simple script step as part of your workflow.

With this combination there are very few things which you cannot do. That's partly the reason why it was possible and straightforward to extend our support to Xamarin apps.

## Getting started

A great way to get started besides reading this tutorial is to check out [James Montemagno](https://twitter.com/jamesmontemagno)'s [video session about setting up Xamarin apps on Bitrise](https://www.youtube.com/watch?v=1UeNajpjIXY).

### What can you do with Xamarin on Bitrise today?

You can build, test and distribute Xamarin iOS & Android applications with Bitrise. You can do that with one workflow, for both platforms. If your project is simple enough it will take approximately 9 button clicks and 3 minutes until it appears on your phone. I know, there is no such thing as a simple project. That's where the highly customizable part comes handy. 😉

#### Build

Before building your Xamarin apps, you are going to need your dependencies installed, if you have any. We currently support [NuGet and Xamarin Components](http://devcenter.bitrise.io/xamarin/restore-nuget-packages-and-xamarin-components/).

We are building iOS projects with [`mdtool`](http://manpages.ubuntu.com/manpages/trusty/man1/mdtool.1.html) and the Android ones with [`xbuild`](http://manpages.ubuntu.com/manpages/utopic/man1/xbuild.1.html) after we analyzed the proper inputs to hand over to the build commands.

#### Test

You are able to run [NUnit](http://www.nunit.org/) and UI tests on Bitrise, you just have to add the corresponding step to your workflow.

You are able to [run your tests in the Xamarin Test Cloud](http://devcenter.bitrise.io/xamarin/run-your-tests-in-the-xamarin-test-cloud/) as well.

#### Distribute

There are [plenty of options for deployment](https://www.bitrise.io/integrations#?filter=deploy). We have our own deployment step, which creates a build artifact, uploads it to our servers and sends your team an email with a link that installs the new version of the app. If you need a more complex solution, like crash reporting included, there's [Fabric](https://github.com/bitrise-io/steps-fabric-crashlytics-beta-deploy), or [HockeyApp](https://github.com/bitrise-steplib/steps-hockeyapp-android-deploy) to the rescue.

### How to get started with Xamarin on Bitrise today?

First, you have to **sign up** on [bitrise.io](https://bitrise.io). You can do that easily with GitHub/Bitbucket or your email address.

It's possibly the best to [connect your Xamarin account to Bitrise](http://devcenter.bitrise.io/xamarin/connect-your-xamarin-account-to-bitrise/) right away, but you will be asked for it if it's missing during your first app setup.

#### Add your apps

When [adding a new app](http://devcenter.bitrise.io/getting-started/create-your-first-app-on-bitrise/), Bitrise will list your repositories for you so you can pick your favorite Xamarin app to build.

![Add new app on Bitrise](add_new_app_bitrise_xamarin.png)

I chose the `sample-apps-xamarin-ios` repo, which contains a [sample Xamarin iOS](https://github.com/bitrise-io/sample-apps-xamarin-ios) application you can fork anytime.

Some in-between steps are selecting branch to build, [(auto-) adding an SSH key to your repo](http://devcenter.bitrise.io/faq/adding-projects-with-submodules/#how-to-do-this-when-you-add-a-new-app) and a validation we run against every repository during setup to make sure we have the right access.

Bitrise will detect and list the available solution files and list configurations to pick.

![Xamarin configuration on Bitrise](set_configuration_bitrise_xamarin.png)

After that you're able to setup a webhook with one click. With this on, Bitrise can build your apps for every push without any manual actions.

>You can always add, disable, or [customize webhooks](http://devcenter.bitrise.io/webhooks/) on your GitHub, Bitbucket, or any other git hosting service.

Then you are ready to roll. 🏁

#### Workflow

A workflow is the lifecycle of your application on Bitrise. That's the flow you define for your application to run when a build is triggered. Workflows are built up from **build steps**, aka [integrations](https://bitrise.io/integrations). You are able to add any step to a workflow, customize it through the GUI, or just [edit the `yml` directly](http://blog.bitrise.io/2016/02/12/edit-your-yaml-files-like-a-boss.html). It's possible to connect workflows before/after each other to run.

The default Xamarin iOS workflow looks like this:

![Default Xamarin iOS app workflow](default_xamarin_ios_workflow.png)

You are able to customize every step's input variables in your favor. Like specifying the platform(s) to build for.

![Xamarin builder step customization](xamarin_step_config.png)

#### Build triggers

There are several ways to trigger builds on Bitrise. You can do it manually, or by pushing code to your remote repository if you have connected webhooks. We also have a [build trigger API](http://devcenter.bitrise.io/api/build-trigger), which you can call with a simple `curl`, or from your app's [Slack channel with one command](https://github.com/bitrise-io/bitrise-webhooks#slack---setup--usage).

#### Code signing

Code signing might sound scary even for practiced developers. The good news is, Bitrise can make it easy for you.

**iOS**

We have an interface for uploading exported identities and provisioning profiles and a step to install them to the build machine. If you can't find the identity to export on your machine, or you'd like to upload more at once, check out [our guide on how to solve that with one command](http://devcenter.bitrise.io/ios/code-signing/).

After you have your exported identities and provisioning profile in your hands, just upload them to Bitrise in your app's workflow editor, under the `Code signing & Files` tab.

![Adding identities and provisioning profiles on Bitrise](upload_identities_prov_prof_bitrise_xamarin.png)

**Android**

If you'd like to have a signed release `.apk`, you just have to upload the locally generated `.keystore` and let `gradle` find it with updating the reference to it.

![Upload keystore to Bitrise](android_keystore_upload.png)

### How it works

As you could see during the app setup phase we had automatically detected your solution files and read out the information. This logic is basically just looking for solution files and parsing the configurations, platforms from it.  

If you are interested in how we are building Xamarin apps exactly, you can check out our [Xamarin builder repository](https://github.com/bitrise-io/xamarin-builder) for more details. Issues and pull requests are always very welcome to this repo as well as to all the others out there. 👐

## Missing something?

It's possible that you can't find the last piece that makes your app build like a charm, so here are some guidance what to do if you find yourself in such a situation.

### Platforms

Currently we support Xamarin iOS and Android apps. [Mac is definitely planned](http://bitrise.uservoice.com/forums/235233-general/suggestions/11425992-xamarin-mac-support), but no ETA yet.

Windows is a different story though. We operate with OS X and Linux machines, no Windows around, and there is no plan to support the Windows platform yet. If you would like to have it though, we listen. Check out the [Bitrise UserVoice page](bitrise.uservoice.com) and create a *there shall be Xamarin for Windows!* ticket, or vote on it if it already exists. It's a great way to indicate what you're missing from Bitrise in general.

### Integrations

There might be something you would like to add to your workflow, but can't find it on [our integrations page](https://www.bitrise.io/integrations). There are several ways to solve this problem:

1. Drop an issue at our [contributions repo](https://github.com/bitrise-io/bitrise-contrib), so somebody (us included) can jump on it.
2. Slightly related to 1., if you contribute to Bitrise, you are going to earn a 50% discount when purchasing a [new plan](https://www.bitrise.io/pricing). 😉 That's why it's even better if you create the step of your dreams yourself. Check out [our CLI's page](https://www.bitrise.io/cli) on how to get started with your own step.
3. Add a ticket or vote on one on [UserVoice](bitrise.uservoice.com).

## Anything else?

You can always share your questions, problems, compliments, or virtual hugs with us on [Twitter](https://twitter.com/bitrise), by [email](mailto:letsconnect@bitrise.io), or on our [public Slack](http://chat.bitrise.io).

If you are attending the [Xamarin EVOLVE conference](https://evolve.xamarin.com/) in April, make sure to come by to our booth for a chat!

See you in part two about testing Xamarin apps on Bitrise and happy building in the meantime! 🤖
