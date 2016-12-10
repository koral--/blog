---
title: Introducing fastlane on Bitrise!
date: 2015-08-05 12:24 UTC
tags: announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---

![fastlane](fastlane_logo.png)

We are really happy to let you know that we officially support [fastlane](https://fastlane.tools)!

## What is fastlane?

`fastlane` lets you define and run your deployment pipelines for different environments. It helps you unify and automate your app’s release process. `fastlane` connects all `fastlane tools` and third party tools, like CocoaPods and xctool.

`fastlane` is a collection of ruby scripts that covers the most usual tasks required when submitting a new iOS app or update to the App Store:

* **deliver** uploads screenshots, metadata and your app to the App Store
* **snapshot** automates taking localized screenshots of your iOS app on every device
* **frameit** quickly puts your screenshots into the right device frames
* **PEM** automatically generates and renew your push notification profiles
* **sigh** automatically generates and manages your provisioning profiles
* **produce** creates new iOS apps on iTunes Connect and Developer Portal
* **cert** automatically creates and maintain iOS code signing certificates
* **codes** creates promo codes for iOS Apps using the command line

## How to get started?

We have created a tutorial to make it easy for you to get started with `fastlane`.

**[Check it out!](http://devcenter.bitrise.io/fastlane/fastlane-tools-integration/)**
