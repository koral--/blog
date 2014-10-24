---
title: Our Step library is now open for submission!
date: 2014-10-24 16:21 UTC
tags: announcement, community
authors: Viktor Benei|viktorbenei@bitrise.io
---

In the last couple of weeks we were working hard to make this happen
and we're increadibly proud that today we can announce that
Bitrise now supports the open [StepLib](http://www.steplib.com/) project
and all of our existing steps are added to the StepLib collection.

This means that from now on you can add your own step to our
collection just by adding it to the open StepLib (by sending a Pull Request
with your step's descriptor step.yml file).

It's still an early stage project and we'll work on making it
easy to use for everyone. The project is completely open source,
you can find the step library/collection repository [here](https://github.com/steplib/steplib)
and even the steplib.com website's code [here](https://github.com/steplib/website).

We're still working on a full revision of the existing steps
to replace the Bitrise specific codes and descriptions
with general purpose ones and to provide the tools
for everyone to run these steps anywhere.

## About security

The open StepLib is open for everyone and we can't verify every
step and version (and we don't even want to control it that tightly).

To keep our security standards high we designed the step library
in a way that separate, verified collections can be created.

The first one is our own [Bitrise Verified Step Collection](https://github.com/bitrise-io/bitrise-step-collection) which is also open source but every step and every version
is verified by our dev team.

Our verified collection is the default one you see when you add a new step
on Bitrise, but from now on you can switch to the
Open Step Library which lists all the available steps in StepLib.

## Bright future ahead

There's still a lot of work to do to make
this new project useful and easy to use for every developer,
we're commited to make it happen.

It's also a huge step forward to an easy to use and *open* build
automation system. Feel free to contact us through Bitrise,
create an issue on StepLib's [GitHub page](https://github.com/steplib/steplib)
or to contribute to the open StepLib project.