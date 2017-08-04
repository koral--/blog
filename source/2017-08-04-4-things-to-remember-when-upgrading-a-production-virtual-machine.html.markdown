---
title: 4 things to remember when upgrading a production Virtual Machine
date: 2017-08-04 09:28 UTC
tags: how-to, devops
authors: Anna Bátki|anna.batki@bitrise.io
overlay: /images/vmupdate-post.png
---

This might come handy for our users using the [Bitrise CLI](http://devcenter.bitrise.io/bitrise-cli/?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w31prodvirtualmachine). 🖥

Frequent upgrades are a good thing, but if you're talking about a production system you have to keep a couple of things in mind. If you follow these rules you can upgrade your production system without worrying about breaking change - "continuous delivery", sort of ;)

1. __Always keep a rollback version, or more!__ This is the most important, we cannot emphasize it enough: in any case, you'll have to be able to roll back a faulty deploy/upgrade as fast as possible, and as reliable as possible.
2. Either __create a totally new one__ - it's a good idea to test automation scripts from time to time
3. Or __clone the current one, update the cloned ones__ then shut down the previous ones - but don't destroy any (yet) for rollback!
4. __Do this for every minor system update/upgrade or configuration change__! We know, but better be safe than sorry.

These will allow you to be able to iterate on your production system quickly, and still keep your sanity.

Happy coding! 🌟
