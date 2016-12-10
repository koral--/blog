---
title: Xamarin stack updates
date: 2016-05-12 13:19 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

## Notes for all Xamarin stacks

There are ongoing changes in the Xamarin tools related to License handling.
Xamarin Alpha already dropped the license requirement, and the tools
doesn't even support the License activation commands we used before.

In addition to this, the process of archiving from the command line also changed,
both on Alpha and Beta.

If you're on the Xamarin Stable channel/stack, you don't have to update anything yet,
there was no breaking change there.

But, **if you're on the Xamarin Beta or Alpha channel/stack, make sure to upgrade
the Xamarin related steps in your workflow**, as only the latest versions of the steps
include the required changes for the breaking changes!

Xcode was also upgraded on all three Xamarin stacks to the latest version: `7.3.1`.

## Changelog of Stable

You can find the Stack's full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-stable.log),
and the full system report `diff` between the current
and the previous version of the Stack at: [https://github.com/bitrise-io/bitrise.io/commit/183ed77434898bf08a7497d243847d65e7476143](https://github.com/bitrise-io/bitrise.io/commit/183ed77434898bf08a7497d243847d65e7476143).

## Changelog of Beta

You can find the Stack's the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-beta.log),
and the full system report `diff` between the current
and the previous version of the Stack at: [https://github.com/bitrise-io/bitrise.io/commit/0d3702cf2803e3fbf5daf6fec46e8fa879a5d672](https://github.com/bitrise-io/bitrise.io/commit/0d3702cf2803e3fbf5daf6fec46e8fa879a5d672).

## Changelog of Alpha

You can find the Stack's the full system report at: [https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log](https://github.com/bitrise-io/bitrise.io/blob/master/system_reports/osx-xamarin-alpha.log),
and the full system report `diff` between the current
and the previous version of the Stack at: [https://github.com/bitrise-io/bitrise.io/commit/66409192eccd4fa11d31673e5d7f502341158cd2](https://github.com/bitrise-io/bitrise.io/commit/66409192eccd4fa11d31673e5d7f502341158cd2).


If you'd like to add a tool to be pre-installed on our Stacks
you can find all the required information at: [https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed](https://github.com/bitrise-io/bitrise.io#request-a-tool-to-be-pre-installed).