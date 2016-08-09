---
title: Automatic IPA re-signing and iOS scheme generation 🤖
date: 2016-08-09 13:48 UTC
tags: features, announcement, code-signing
authors: Daniel Balla|danielballa@bitrise.io
---

iOS developers, rejoice, we've just made your lives much easier! You can forget about forgetting to share schemes and then forgetting to do a commit. Too much to keep in mind. We've also made iOS code signing significantly faster and a bit less painful. Read on to find out the details!

##These are <s>not</s> the schemes you are looking for 🕵

Remember when you forgot to set your schemes to shared in Xcode and you had to go back, fix it and then commit the change? This was a pesky little distraction for those who were eager to add their project to Bitrise, but weren't able, because of this very issue.
We know how busy your day could get, and we totally understand that you occasionally forgot about sharing schemes, so we fixed it for you. Simple as that.

"Okay, but what do I have to do to make it work?" - you might ask. Nothing. In the off-chance of not finding any shared schemes in your project, we'll automatically generate them for you, based on your project settings, which you can select from. We will use this generated  scheme for every future build you might kick off, so it would always work.

>**Important note:** the suggested method is still that you should share your schemes, so once you fix this, we'll use your schemes and won't attempt any regeneration - because that would be silly.


##Automagically re-sign your iOS app 💫

You may want to build your iOS app for Development but you also want to have an IPA with the App Store distribution type. Previously you had to run two Xcode Archives to make this happen, which consumed priceless build minutes, and wasted your time unnecessarily. Now all you need is one `Xcode Archive` step and the `Re-sign IPA` step after that which will automatically re-sign your app to the desired distribution type.
The result? Two fresh IPAs for half the time! [You should read this handy tutorial](https://bitrise-io.github.io/devcenter/ios/resigning-an-ipa/) that we've prepared, which contains the setup guide and a few tips on how we suggest using this neat feature effectively.

You can expect more improvements regarding code signing in the near future, so stay tuned! It will be even more magical. ✨
