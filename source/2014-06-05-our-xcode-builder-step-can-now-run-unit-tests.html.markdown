---
title: Our Xcode Builder Step can now run Unit Tests
date: 2014-06-05 14:34 UTC
tags: step, update
authors: Viktor Benei|viktor.benei@gmail.com
---

We just updated our Xcode Builder step (available on GitHub: [https://github.com/concretebuilder/steps-xcode-builder](https://github.com/concretebuilder/steps-xcode-builder) - feel free to fork it) with the option to run Xcode unit tests.

A new Step was added to the Concrete Step Library, you can now add this to your workflows.

The Step supports both Xcode's command line xcodebuilder and the popular xctool, runs the tests with the Xcode Simulator and supports to choose the Simulator device which will run the tests. 

The default device is the "iPad" Simulator, but you can set other Simulator devices like "iPhone Retina (4-inch)". If you want to specify the device you'll have to give the full name of the device, the one you can see in the Xcode GUI at the top-left device selector.

A few examples:

- iPhone Retina (4-inch)
- iPhone Retina (4-inch 64-bit)
- iPad
- iPad Retina (64-bit)

Additionally you can specify the OS version of the device by appending "OS=x.x" to the end of the device name.

For example: 

- iPhone Retina (4-inch),OS=7.1
- iPad Retina (64-bit),OS=7.1

To get all the supported device OS versions you can use our updated System Info Reporter (read more below).


# System Info Reporter Step was also updated

We added a new report to the System Info Reporter Step (available on GitHub: [https://github.com/concretebuilder/steps-system-info-reporter](https://github.com/concretebuilder/steps-system-info-reporter) - feel free to fork it) to list all the available SDKs you can use with Xcode, for your Unit Tests.


Have fun with Unit Testing your iOS projects and let us know what you think about Unit Testing with Concrete!