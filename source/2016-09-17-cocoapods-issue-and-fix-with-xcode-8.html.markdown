---
title: CocoaPods issue (and fix) with Xcode 8
date: 2016-09-17 06:32 UTC
tags: ios, fix, xcode8
authors: Viktor Benei|viktorbenei@bitrise.io
---

Now that more and more teams migrate to use Xcode 8 we saw a couple of frequent issues
reported by our users.

One of the most frequent ones is related to CocoaPods and the Swift version.
The error looks something like:

<pre><code>** ARCHIVE FAILED **

The following build commands failed:
    Check dependencies
</code></pre>

The first step if you get an error like this and you don't see more details about
the error in the log, is to switch the `Output Tool` option of the related
Xcode step to `xcodebuild`. The default value is `xcpretty`, which is an awesome
Xcode log formatter tool, but in some cases it omits important details about the error.

In the raw xcodebuild log if you have an error like:

<pre><code>Check dependencies
“Use Legacy Swift Language Version” (SWIFT_VERSION) is required to be configured correctly for targets which use Swift. Use the [Edit > Convert > To Current Swift Syntax…] menu to choose a Swift version or use the Build Settings editor to configure the build setting directly.
</code></pre>

and you use CocoaPods, the most likely cause of the error is that
CocoaPods might not set your pod projects' swift version correctly.

You can find the related CocoaPods issue [on GitHub](https://github.com/CocoaPods/CocoaPods/issues/5521),
and as mentioned there the fix is to add the following code to your `Podfile`:

<pre><code>post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end</code></pre>

Huge thanks for __@snydersaurus__ who reported this and the fix on our [Slack](http://chat.bitrise.io/)!

**Happy Building!** 🚀
