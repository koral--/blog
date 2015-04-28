---
title: Announcing status images
date: 2015-04-25 14:01 UTC
tags: announcement
authors: Barnabas Birmacher|birmacher@bitrise.io
---

Status images have finally arrived to Bitrise! From now on you can embed your project's status image to your project's README file, documentation or wherever you want and show it to your visitors.

Here is our website's status ( hope it's green when you reed this:) )

[![Build Status](https://www.bitrise.io/app/3fedf9cc1f9d8afa.svg?token=TOKEN)](https://www.bitrise.io)


Currently we are only supporting private apps on Bitrise so security was a huge issue when integrating this request into our service. You already have an API token that you can use to start manual builds. It's a great feature but it's a big risk to use it in a public environment.

Therefore we created a new read-only token just for interacting with the status image, so you can show it anywhere and still have your project in full safety.

You can find the embedding codes in your project's page. Grab it, add it to wherever you want and once it's public shoot us a line to get some free stickers!