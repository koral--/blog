---
title: The new Workflow system
date: 2015-01-29 12:09 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

The final step of the series of major user experience revisions
we announced at the end of last year is now complete.
The new Workflow system is more capable, more flexible
and hopefully easier to use than ever before.

It wasn't easy to include all the features of our vision
of the Workflow editor into a single page, pleasing to the eye.
We'll probably do a couple of refinements
in the future but it now represents what we think a great
Workflow editor should look like.

And as we promised the revision was not just about beauty,
it was at least as much about making the
Workflow system capable of the things we originally planned.
Below you can find the more significant new features
of the new Workflow system.


## Import and Export Workflows

After you prepare your Workflow you can export it
in both JSON and YAML formats. For this
you should click on the *Show More* option
at the top right corner of the Workflow in editor mode.

You can store your Workflow in your app's repository,
modify it in your text editor, share it with others
or use it as a template for new apps you add on Bitrise.
It's all up to you, and it's all yours!

*Some of you requested that if you create a workflow file
in your repository Bitrise should use that for builds.
We're still considering this option but we think
that it is more flexible to separate the build
workflow from the repository - check out
the **Specify different Workflows for separate branches** section
for a detailed description.*


## Step: Icons, Rename and Duplicate

These are mainly utility functions but were requested
by you and we found these incredibly helpful in
creating and maintaining more complex Workflows.

First of all Steps now have their own icons
which make it easier to find the one you're looking for.

After you add a Step to your Workflow you can
change it's title to anything you want to.
It's especially useful if you use the same Step
multiple times in your Workflow, which is
a common case if you use your own scripts
but want to separate them instead of including
all the scripts in a single script step.

Finally you can now duplicate Steps with just
one click so you don't have to add and configure
the same step again. It can be useful in situations
like sending a [Slack](https://slack.com/){:target="_blank"} message
right when the build starts and one more when the
build finishes.


## Specify different Workflows for separate branches

We had a similar feature in our previous system too
but the new one is more customizable and more
obvious to work with.

When you create a new app on Bitrise you'll get a base
Workflow with just a couple of base testing steps.
This Workflow is your *primary* workflow, you can
edit it but you can't delete it and it'll be used
for every build where no other Workflow is specified.

As a best practice you should have a base testing
Workflow which performs tests for every code push
in your repository - this is the purpose of the
primary workflow.

After the testing you probably want to deploy your
app for your testers. With the new Workflow system
you can now create new Workflows for as many
branch as you like and configure it the way you want to.

Let's say you want to deploy your app for your internal
testers every time you push code to the *master* branch
and maybe for another set of testers if you push code
to your *production* branch.

You can now do that by creating two
new Workflows for your app, one for *master*
and one for *production*, setting up the
deployment steps and customizing any other parameter
you want to (the list of testers for example)
and you don't have to anything else.

With a setup like this you don't have to do
anything manually, everything *just works*,
all you have to do is work on your code
and Bitrise will do the rest. **You control
the whole process with your repository.**


## Overwrite default Environment Variables and change default settings

Workflows can have their own set of environment variables
as well, you can manage these if you click on the
*Preparing the Build Environment* step in the
Workflow editor.

You can define your own environment variables
and you can overwrite default build environments too.
Bitrise passes every build parameter as an environment variable
so you can change or use those the way you want to.

You can now set the Xcode Project's path and
the Scheme to be used for the build in your app's *Settings tab*
but you can overwrite those in your Workflows.

For example your default, primary workflow can
build with the default Scheme you picked when you registered
the app on Bitrise but you might want to
use another Scheme if the code was pushed to
a special branch.

In this case you can create a new Workflow
for the special branch, click on the
*Preparing the Build Environment* step,
select the *Overwrite a Default* option
and select the `$BITRISE_SCHEME`
from the default environments list
and define a new value which will overwrite
the default value (which you can change on
the Settings tab).

You can even use the default environment's value
and just change it. For example
if you would like to append "-test" to the app's
title you can do it by clicking on
the *Overwrite a Default* option,
selecting the `$BITRISE_APP_TITLE` environment
and specifying `${BITRISE_APP_TITLE}-title`
as it's value. You just have to make
sure that the *Replace variables in input?* option
under the variable's key is enabled so it will
resolve the environment variables in the
input before storing it as a new environment,
available for all Steps in the Workflow.


## Create and use your own, custom steps

Another important thing we wanted to solve is
to make it easier for you to create your own steps
and to share it with others through
the [Open Step Library](http://www.steplib.com/){:target="_blank"}.

With the new Workflow system adding your own
Step is as easy as clicking on the plus sign
at the left side of the editor and
selecting the *Custom Step* option.

There you can just copy-paste your Step's
description (which you should store
in your step's repository as *step.yml*)
and it's done. You can try it with any of the
Steps you can find in the Step Libraries
(you know that you can see the code of any Step
in your Workflow by clicking on the *View source code*
link right? ;), copy-paste the raw content of
a *step.yml* file and it'll just work.


## Create the Workflow you want

The new Workflow system is way more powerful
than the one we had before. We hope that with these
improvements you can now create the build and automation
configurations you wanted to and maybe even more.

We would love to hear what other use cases you can find
for Bitrise, what development automations you can think
of and what are the things we can improve
to provide the feature support you need to
make your app development as painless as possible.

We're always happy to help you to setup your
Workflows and to create your own Step.


> As always if you have any issues or suggestion
> you can [contact us](http://www.bitrise.io/contact?utm_source=blog&utm_medium=blog&utm_campaign=bitrise){:target="_blank"}
> or leave a comment below,
> we're happy to help
> and to discuss about Bitrise.