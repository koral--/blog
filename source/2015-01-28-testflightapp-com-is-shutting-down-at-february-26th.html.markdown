---
title: TestFlightApp.com is shutting down at February 26th
date: 2015-01-28 18:45 UTC
tags: announcement
authors: Viktor Benei|viktorbenei@bitrise.io
---

Apple announced a couple of days ago the sad news
that probably the most popular iOS beta testing service,
the "old" TestFlightApp.com is shutting down.
And it's shutting down very soon, in less than a month.

It wouldn't be a huge issue if they would provide a
viable alternative with their new, iTunes Connect
integration version of TestFlight but unfortunately
Apple haven't announced any API integration for the new
service yet and the new service has other
limitations as well which make it almost unusable for
*automatic*, continuous integration build distribution.

To address the issue we'll do two things:

1) **We'll add a couple of new deployment services**. Feel free to send us suggestions, which deployment and beta testing services we should support.

2) **We'll also release our own, integrated solution**.

We'll do the best we can to make the transition as seamless
as possible. Our plans for the integrated deployment feature
is to provide great app beta test *distribution*, we don't plan
to provide a testing SDK and other reporting features
TestFlightApp has.

Our solution will be easy and quick to setup
and we'll try to provide great support for distributing
your automatic app builds to your testers.
But if you need advanced tester activity monitoring, crash reporting
and other beta testing features you'll have to look at alternatives like
[HockeyApp](http://hockeyapp.net/){:target="_blank"} (we already have
an integration step for HockeyApp),
[installrapp.com](http://www.installrapp.com/){:target="_blank"},
[Crashlytics](https://try.crashlytics.com/){:target="_blank"} or
[birdflightapp.com](https://www.birdflightapp.com/){:target="_blank"}.

If you have the time you can create your own deployment
service integration too, you can use
our [HockeyApp](https://github.com/bitrise-io/step-hockeyapp-deploy){:target="_blank"} and [TestFlight](https://github.com/bitrise-io/step-testflight-deploy){:target="_blank"}
step codes as a starting point. Contact us if you need
help with getting started with Step development.
