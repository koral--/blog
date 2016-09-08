---
title: New export ipa options for xcode-archive step
date: 2016-09-06 16:44 UTC
tags: step-update, ios-dev
authors: Krisztián Gödrei|krisztiangodrei@bitrise.io
---

# New export ipa options for xcode-archive step

`Xcode 7` instroduced a lot of additional archive feature and the support for
defining more complex archive parameters. The export command's __new version__ expects a Plist file (`-exportOptionsPlist`),
which should include all the archive parameters (including code signing type/method,
and other parameters like enable/disable Bitcode). 

Regarding to this Xcode update, we introduced `export_options_path` input to __xcode-archive__ step, to allow specify this options. If `export_options_path` is not set the step generates this export options plist file for you. The export option generator __determins the export method based on the xcarchive__ embedded provisioning profile and leaves every __other inputs on default value__. [Read more](https://bitrise-io.github.io/devcenter/tips-and-tricks/xcodebuild-export-options/)

This seemed to be a good solution, but later we realized that there are __commonly used options__, like: `method`, `uploadBitcode` and `compileBitcode` which would be great to controller easier than defining the whole `export_options.plist` file. On the other hand this file is not required part of your xcode project, it is only used by ci environment. So it would be great to store export options in your ci configurations.

These thoughts led us to introduce new `xcode-archive` inputs:  

- `export_method`: describes how Xcode should export the archive, options: `auto-detect`, `app-store`, `ad-hoc`, `enterprise` and `development`.  

  _If you select `auto-detect` step will figure out proper export method based on provisioning profile embedded into generated xcarchive._
  
- `upload_bitcode`: for __App Store__ exports, controls if the package should include bitcode.
- `compile_bitcode`: for __non-App Store__ exports, controls if Xcode should re-compile the app from bitcode.
- `team_id`: the Developer Portal team to use for this export.
