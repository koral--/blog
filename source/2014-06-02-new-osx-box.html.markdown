---
title: New OSX Box
date: 2014-06-02 12:55 UTC
tags: box, update
authors: Viktor Benei|viktor.benei@gmail.com
---

# New Base box available!


## What changed?

- GEM_HOME Environment Variable export removed from the ~/.bashrc profile
- instead of using the default OS X Ruby we switched to RVM
- ruby 2.0.0-p481 installed with RVM and made it the default Ruby
- re-installed Cocoapods (0.33.1) with the new RVM ruby
- brew upgrade:
    - git 2.0.0
    - xctool 0.1.16
- OS X update: iTunes 11.2.2


## Why RVM?

With the default OS X system Ruby we had a lot of troubles building Ruby native gem extensions (especially with Nokogiri, it's just a pain in the ass to install with the system default Ruby). With the RVM Ruby all of the issues stopped. 

Hopefully this will make it much easier for everyone to use Ruby in your Steps. And if you need another version of Ruby for some reason you can install the exact version you need with RVM.