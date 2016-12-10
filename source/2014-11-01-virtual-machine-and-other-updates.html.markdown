---
title: The new Virtual Machines are live and other updates
date: 2014-11-01 13:01 UTC
tags: announcement, status, box-update
authors: Viktor Benei|viktorbenei@bitrise.io
---

# Virtual Machine update

We finished the virtual machine update which was announced [here](/2014/10/27/scheduled-virtual-machine-box-update.html) and every build virtual machine is updated now.


# Undo feature added to Workflow Step update

From time to time steps introduce incompatible interface changes (for example
an input changes) which might cause that when you update the step to a new version
in your workflow some of your previously set inputs might disappear.

This should only happen when a major, breaking change was
introduced in the new version of the step
which affects the step's input specification (not a frequent event)
but losing any type of data is always bad.

For this we added an "Undo" option to the workflow step update.
After you change the version of a step in your workflow (be it
an update or a downgrade) an **"Undo Version Change"** button
will appear right next to the step version selector.

Click it and your step will be restored to the exact
state before the version change - including all the
content of the input fields.

**One thing to keep in mind**: this undo option is only available
while you stay on the workflow page. *Once you leave the
workflow page you won't be able to undo a previous version change.*


# Skip

This one is a long requested "must have" feature.
From now on the default behavior of steps is that if a step
fails during the build all the steps which would run after it
will be skipped.

So for example if your Archive step fails then your
TestFlight step will be skipped (reason: there's no app archive
to upload). Or if your code can't be downloaded (git cloned)
into the build virtual machine then there's no point of performing
any Xcode (build, archive, etc.) action on it - these will be skipped.

You can however **mark** individual steps in your workflow page
as **"always run"** which means that no matter what, even if another
step failed the marked step will still run.

Useful for reporting type steps like a HipChat message
step which sends you a summary of your build,
even if the build itself failed.

*You can mark a step to always run on your app's workflow page,
under the **Always run this step?** section.*


> If you have any problem with the new base box let us know below in the comments section
> or [contact us](https://www.bitrise.io/contact)!
