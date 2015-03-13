---
title: Weekly Virtual Machine update schedule & status - March 2-7
date: 2015-03-03 13:18 UTC
tags: announcement, status
authors: Viktor Benei|viktorbenei@bitrise.io
---

We now have the list of pre-installed tool version changes,
we expect this to be the complete list of updates
for the upcoming Virtual Machine update.


## Schedule & Status

The Virtual Machine update is scheduled for **Saturday, March 7, 2015**,
we'll update this section with the status of the update.
*We don't expect any downtime during the update, but build queue
times might be longer while we disconnect a set of
builder machines for the update.*

**Update**: the virtual machine update is now finished,
we published a new blog post with the details of the new
Xcode version naming scheme.


## Planned changes

* OS X: 10.10.1 -> 10.10.2
* Xcode naming change: instead of storing Xcodes with the version number included in the Xcode app's name we'll use a couple of state indicators:
  * Xcode-stable.app : latest stable release (6.1.1)
  * Xcode-beta.app : latest beta release (6.3b2)
* xctool: 0.2.1 -> 0.2.2
* git: 2.2.0 -> 2.3.1
* mercurial: 3.2.1 -> 3.3
* go: 1.3.3 -> 1.4.2
* NodeJS: 0.10.33 -> v0.12.0
* NPM: 2.1.10 -> 2.5.1
* wget: 1.16 -> 1.16.2
* ansible: 1.8.1 -> 1.8.4
* nomad-cli: 2.4.3 -> 2.4.6
* RVM: 1.26.3 -> 1.26.10
* Ruby: 2.1.5 installed with RVM, 2.1.5 is set as default



