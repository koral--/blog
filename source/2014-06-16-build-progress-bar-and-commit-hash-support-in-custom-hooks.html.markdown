---
title: Build Progress-bar and Commit Hash support in custom hooks
date: 2014-06-16 12:19 UTC
tags: announcement, step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Build Progress-bar

On the Build Details page (you can get to this page if you click on a build) there's now a Progress-bar to make it even easier to check the status of a build:

![In progress Build with Progress-bar](build-progress-bar.png)

After the Build finishes the color of the Progress-bar will indicate whether the Build was successful or there were some issues with the Build.

A successful Build's Progress-bar:
![A successful Build's Progress-bar](build-progress-bar-success.png)

And a failed Build's Progress-bar looks like this:
![A failed Build's Progress-bar](build-progress-bar-error.png)


## Custom hooks: Commit Hash support!

From now on we have one more Build Parameter we support for custom URL hooks:
**commit_hash** (SHA hash of a specific git commit)

Similar to the *tag* parameter you can define this parameter through the *payload* parameter of the POST request and if it's defined Bitrise will add the relevant *$BITRISE_GIT_COMMIT* Environment Variable to your build's environment, so the Steps which support this variable can handle it.

Example:

`'payload={"repository":{"url":"..."},"hook_info":{"type":"bitrise"},"build_params":{"commit_hash":"fc486d0395b9e84ffc9b1ba59c83ad836c719fd2"}}'`

For more information about the Build Trigger API check out our Dev Center at: [http://devcenter.bitrise.io/api/build-trigger](http://devcenter.bitrise.io/api/build-trigger){:target="_blank"}

And for examples specific to your app on Bitrise you can check out the **Settings** tab of your app and click on the **REPOSITORY HOOK** section.


## Updated Git Clone Repository Step

The latest version (**1.0.8**) of the **Git Clone Repository** Step now supports the *BITRISE_GIT_COMMIT* Environment Variable, it is fully compatible with the new **commit_hash** hook parameter.
