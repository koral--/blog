---
title: State of App Development in 2016
date: 2017-01-27 04:12 UTC
tags: announcement, community, insights
authors: Daniel Balla|danielballa@bitrise.io
overlay: /images/stateofapps.jpg
---

We are talking to a lot of companies developing mobile apps and we also analyze a ton of behavioral data daily to understand how we could improve [Bitrise](https://www.bitrise.io) to give the best experience for mobile development. We thought it would be interesting to break our findings down to numbers and look at the big picture.

Questions we asked our database included:

- Github/Bitbucket/GitLab?
- Hosted/Self-hosted?
- What is the most popular platform?
- What integrations are most frequently used?
- How much time do companies spend on automated tests?
- How often do companies do releases?
- How often do companies deploy to their testers?

And a little special edition for iOS developers:

- What are the most common iOS Code Signing and build mistakes?

##10,000 apps under the hood

We randomly selected 10,000 apps as a base, that are getting built regularly on Bitrise. It feels a nice and big enough number to give us a good picture about the major trends.

##Git hosting in the cloud

Not a huge surprise here. **Almost two-thirds of these apps are hosted on GitHub and one-third is living on Bitbucket.** Only 2.5% of apps are hosted on GitLab, and a meager 1.6% on Microsoft's Visual Studio Team Services.

![001](001_cloud.png)

GitLab and VSTS is a newcomer on Bitrise, so our data is only for half a year of usage, so we expect these percentages to grow. Although probably for a while GitHub and Bitbucket is going to be the two major players in this field.

##Self-hosted

Now this is way more interesting. **More than two-thirds of self-hosted apps prefer to use GitLab's on-premise solution.** GitHub and Bitbucket is head to head with around 7% each. Other kind of self-hosted solutions are too saturated to show accurate results, however they take a huge chunk of this segment as they add up.

![002](002_selfhosted.png)

We see that lately a lot of indie developers and small teams prefer to host their code themselves. GitLab made their offering very appealing, especially for open source projects, taking a huge slice from the pie.

##Hosted or self-hosted?

If we’re looking at number of repositories, hosting code in the cloud is still the preferred choice for companies. **95% of apps live in the cloud** while only 5% of them are self-hosted.

![003](003_hostedvsself.png)

##Most popular platform 🍏

It looks like **iOS is still the first platform of choice** for companies, with a whopping 66%. The rest of the pie is divided between Android (22%) and Xamarin apps (12%). Xamarin, being a cross-platform tool, actually ends up as both iOS and Android apps, which means that the final breakdown is **iOS: 72% / Android: 28%.**

![004](004_platforms.png)

As of end of last year, **Google's Play Store boasts 2,600,000 apps**, while **Apple's App Store is reported to hold 2,000,000 apps.** Although the Play store surpasses the App Store in number of apps, developers still choose to build on iOS first.
One of the reasons might be because iOS apps see more downloads on average than Android ones. In 2016, **Google announced that 65 billion apps had been downloaded** from Google Play, while **Apple is way beyond with 130 billion downloads.**

![005](005_appstore_vs_googleplay.png)

It's also true that reportedly iOS apps see much more revenue over time than their Android counterparts. Apple announced that [they paid $50 billion](http://www.zdnet.com/article/apple-wwdc-2016-keynote-by-the-numbers/) to developers, while Google's payout is [a third of that](https://techcrunch.com/2017/01/17/app-downloads-up-15-percent-in-2016-revenue-up-40-percent-thanks-to-china/?ncid=rss), making iOS the smarter bet.

##Steps & integrations

>There are currently around a [100 steps and integrations](https://www.bitrise.io/integrations) in the Bitrise ecosystem. Each of these steps are responsible for a small task, that can be inserted in the build workflow. These can range from running tests, archiving the app, deploying, releasing or notifying team members, among others.

Our Script step was run more than 1,500,000 times. This step is used when someone needs to run a custom command or install/update a tool which is not available on our virtual machines. Repositories were cloned more than 1,000,000 times, while developers deployed to Bitrise on more than 500,000 occasions.

![006](006_integrations.png)

###Third-party integrations 🌟

The most used third-party integration is everyone's favorite messaging service, Slack, being also the preferred tool of choice for keeping team members notified about build status and deploys.
What we've also noticed that companies love to combine fastlane's smart tooling with Bitrise, being a close second in popular third parties.
Companies tool of choice for deployment seems to be Microsoft's HockeyApp with more than 60,000 deploys, while Codecov being the favorite for continuously checking code coverage, with 25,000 runs.

###Automated tests

We were curious to find out what's the success ratio for unit and UI tests for iOS and Android builds. It turns out that **63% of iOS tests succeed, while Android tests have an 80% success rate.** Nice job, Android devs! 🤖

![007](007_tests.png)

###Deploys & releases 🚀

Continuous integration and delivery practices let companies deploy and release their apps more rapidly than they would care to do manually. This means that developers can iterate more quickly and gather more feedback about bugs in their apps.

**iOS apps were released to the App Store more than 26,000 times during last year,** which means 26 releases a year for every app. Counting averages here doesn't tell us too much, though. Digging deeper we see that individual or freelancer developers tend to release their apps only a few times a year, while bigger teams choose to do quick, periodic releases.

Meanwhile **internal iOS deploys happened more than 400,000 times,** which tells us that every iOS app is being deployed 33 times a month. **That means a bit more than 1 deploy every day** to testers, team members or clients. This lets companies test their apps with a fresh build running on their device each day. Wow.

![008](008_deploys.png)

**Developers of Android apps weren't that trigger happy in 2016, releasing only 6,000 times during last year.** That counts for less than 1 release per app per year. This is such a ridiculously low number, that we think that either the Play Store release is included in the apps' Gradle file or that Android developers choose to do the release process manually to Google Play, rather than automating it. That's not a huge surprise, considering how much easier it is to handle code signing and releases for Android than iOS. Unfortunately we had no way to measure releases through Gradle.

**Internal Android deploys happened more than 200,000 times,** testers receiving fresh builds every other day on average, or 16 every month.

##Common build mistakes you've probably made

We thought it would be useful to reveal the most frequent causes for build failures, including a handy solution for each of them. This is our way of showing you’re not the only one.

###Messing up iOS Code Signing 🎖

The first place obviously goes to this. Apple's code signing and distribution process is not designed for rapid iteration, and the larger the team is, the harder it gets to manage all your signing files.
The #1 mistake is not adding *any* provisioning profile or certificate when trying to archive. Second place goes to adding the wrong kind of code signing files. Darn!

To make this more straightforward, we've created the Codesigndoc tool, which, while running an archive for a project, parses all the info from the logs for all necessary signing files, then exports it to a folder.

For Xcode projects, all you need to run is this command:
`bash -l -c "$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap.sh)"`

For Xamarin projects, you'll need this script:
`bash -l -c "$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap-xamarin.sh)"`

After the export is done, you just need to upload all the files to Bitrise and use Xcode’s automatic code signing option, while only setting targets for the archives.

###Not sharing Xcode Schemes 🥈

The silver medal of mistakes goes also to an Xcode related issue, when developers simply forget to set their schemes to `shared`. This means, that in a hosted environment, such as on [Bitrise](https://www.bitrise.io), after cloning the repository the correct scheme cannot be found and used.

To solve this on Bitrise, we've created the `Recreate user scheme` step, which is creating the correct schemes during every build, and is automatically added at project setup, if our scanner can't find the correct files. This step is currently used in 10% of iOS projects.

So, everyone, write "Share all the schemes!" on a post-it, and put it on the wall! Or set this image as your screensaver:

![009](010_share.jpg)

###Adding the wrong stuff to .gitignore 🥉

Our bronze medalist is very similar to the previous mistake. Developers sometimes put files to .gitignore, which would be necessary to build the project, such as those pesky shared schemes.

You can test very easily what you might miss, by cloning your repository to a new directory, checking if the scheme files are there, or you can try building it [with our CLI](https://www.bitrise.io/cli) or with Xcode CLI. If you do a git clone and open the project in Xcode.app, that can auto fix this, similar to how the Recreate User Schemes step does this. If everything goes well, we salute you on being so thorough! If not, check your .gitignore.

##Automate everything!

Some of the world's most interesting companies build their apps on Bitrise, like Google, Foursquare, InVision, Runkeeper or Mapbox along with thousands of other startups, enterprises and indie developers. We're proud to say that in 2016 we've saved 145,516 hours for all these companies altogether. That's almost 17 years saved in 1 year! Marty McFly would be proud.

![010](009_saved.png)

We hope these insights were as interesting for you as for us. We love feedback, so please comment or [share this article](https://ctt.ec/AW2bC) if you have any suggestions, or if we missed anything you might be interested in! We're proud to help so many great people saving countless hours and ensuring code quality, making sure that you have more time for your ideas and for your code.

We have a few big announcements to make in the coming months, so keep an eye out by [following us on Twitter](https://twitter.com/bitrise), or [joining our awesome Slack channel](http://chat.bitrise.io), or be a part of our [Discuss Bitrise community](https://discuss.bitrise.io).

Happy building in 2017!
