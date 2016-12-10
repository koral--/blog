---
title: Step Updates
date: 2014-06-23 17:07 UTC
tags: step-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

Lately we updated quite a few of our core Steps, here are the more significant updates:


## Git Clone Step

*Repository: [https://github.com/bitrise-io/steps-git-clone](https://github.com/bitrise-io/steps-git-clone)*

There were two significant changes:

1. the Step will now save the private SSH key into *~/.ssh/bitrise*
2. for additional security the Step will remove the private SSH key after the clone finishes


### HipChat Step ######

*Repository: [https://github.com/bitrise-io/steps-hipchat](https://github.com/bitrise-io/steps-hipchat){:target="_blank"}*

Complete rewrite in bash script (previously it was Ruby based) to make it faster and more compact.
Additionally the new version supports HipChat's Message color.


# System Information Reporter Step

*Repository: [https://github.com/bitrise-io/steps-system-info-reporter](https://github.com/bitrise-io/steps-system-info-reporter){:target="_blank"}*

As mentioned in a [previous post](/2014/06/23/minor-box-update.html) the Step now generates a Formatted Step Output which is presented in the Step's output on the Build Details page.


# [NEW] Amazon S3 bucket sync Step

*Repository: [https://github.com/bitrise-io/steps-amazon-s3-upload](https://github.com/bitrise-io/steps-amazon-s3-upload){:target="_blank"}*

This new Step can upload a given folder to an Amazon S3 bucket. With this you can publish a static website or upload build artifacts to Amazon S3.

**Warning:** as stated on the GitHub page this Step replaces the target bucket's content with the content of the specified folder!


# [NEW] Secure Delete File or Folder

*Repository: [https://github.com/bitrise-io/steps-secure-delete-path](https://github.com/bitrise-io/steps-secure-delete-path){:target="_blank"}*

Right now all the available Steps are maintained by us and we erase the Build Virtual Machine before every Build (<a href="http://devcenter.bitrise.io/getting-started/code-security/" target="_blank">read more on our Dev Center</a>, but for an additional security of your code with this Step you can securely delete any file or folder.

If you want to remove your source code right after the builds just add this Step to your Workflow, below your Build, Unit Test, Archive and other Steps which use the source code and set the **File or Folder path to delete** input to **$BITRISE_SOURCE_DIR** (you can select this Variable from the *Insert Variable* popup, described in our [previous post](/2014/06/23/insert-environment-variables-in-your-workflow.html)) and leave the *Use sudo for delete?* input empty (default is *yes, use sudo*)
