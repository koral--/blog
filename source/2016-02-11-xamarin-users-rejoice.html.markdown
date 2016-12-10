---
title: Xamarin users, rejoice!
date: 2016-02-11 11:37 UTC
tags: announcement
authors: Daniel Balla|danielballa@bitrise.io
---

![Xamarin partnership](xamarin.svg)

Exciting times! We partnered up with [Xamarin](https://xamarin.com) to bring the joy of build automation to even more people. Our goal is to be the go-to CI solution for everyone developing mobile apps, and that naturally includes the leading cross-platform IDE out there. We went the extra mile to create a comfortable, compact platform for you which integrates with Xamarin's best features.

##Build!

Configure your **Xamarin.iOS** and **Xamarin.Android** projects on Bitrise with just a few clicks and build, build, build away! You'll notice that we have [quite a few build steps](https://www.bitrise.io/integrations) already which you can add to your workflow to build, test and [deploy](http://devcenter.bitrise.io/xamarin/deploy-your-xamarin-app/) your app. You'll soon ask yourself how you could live without all this before.
And to top that off, we made a friendly deal with the nice people at Xamarin so you wouldn't need any extra seat or a business licence to build apps with Bitrise. All you need is a valid Xamarin licence and... yes, that's it. Amazing, right?

>Xamarin.Mac developers, hang tight for a while, because we'll soon release support for your apps, too!

##Test!

Okay, we have the building part out of the way, but what is CI without the testing part, you might ask. We've got you covered, of course *- why would we write a whole section with the title "test" otherwise, duh!*
You can run your NUnit tests on simulators with ease, or if you are in the mood for some real device testing, just add the [Xamarin Test Cloud](https://xamarin.com/test-cloud) step to your workflow and you're all set! If you'd need a little help getting started, you can find tutorials and guides in the [Xamarin section of our DevCenter](http://devcenter.bitrise.io/xamarin/).

>A little good came out of all this for non-Xamarin users, too: if you are using [Calabash](http://calaba.sh), you can add the step for native iOS and Android projects as well to run them on Xamarin Test Cloud. Woot-woot!

##Crash reporting!

If you are even more thorough and use Xamarin.Insights, you can now include it in your CI workflow, too. And you guessed it right, it's just adding a step to your workflow and every time it's executed, your dSYM will be uploaded to your Insights platform.
If you need more info about Xamarin.Insights, [head over to its website](https://xamarin.com/insights) to learn more and realize how useful it actually is.

##FAKE is real

Maybe you fancy using [FAKE](http://fsharp.github.io/FAKE/) to build your Xamarin apps. That's fine, you can easily do that. For now you'll need to add a [simple script step to your workflow](http://devcenter.bitrise.io/tutorials/build-with-fake/) to start using it, but we'll release the official step in the near future after we tested it out with you!

>We prepared a few [helpful guides on our Devcenter](http://devcenter.bitrise.io/xamarin/) to make it easy setting up your Xamarin porjects on Bitrise. Use them wisely.

We hope this new partnership will bring many fresh and exciting features and benefits for you, and we'll continue improving Bitrise to make more and more mobile developers happy around the world! If you have any feedback, [tweet at us](https://twitter.com/bitrise), [chat with us](http://chat.bitrise.io) or [write to us](mailto:letsconnect@bitrise.io), we are curious what you think!
