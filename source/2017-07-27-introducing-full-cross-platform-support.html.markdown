---
title: Introducing full cross-platform support
date: 2017-07-27 14:16 UTC
tags: announcement
authors: Anna Bátki|anna.batki@bitrise.io
overlay: /images/crossplatform.jpg
---

Hoooorray! Now we support all major cross-platform and hybrid frameworks! These frameworks became more and more popular as in some cases it is much easier to develop and maintain 1 code base for all the supported platforms than 1 code base per platform.

In addition to iOS, Android, Xamarin, fastlane and macOS, you can choose the following project types for your app on Bitrise:

- __Cordova__
- __Ionic__
- __React Native__

#How does it look?

For these project types

- we developed a list of the most common steps for testing and building your project
- the new project-types will be detected when you add a new app
- our scanner will generate an initial bitrise configuration (bitrise.yml) for your app


The scanner tries to generate __two workflows__ for you: one for __testing (primary)__ and another workflow for __releasing your app (deploy)__. (If the scanner does not detect any known testing framework in your repository, you will get only _one workflow (primary), which builds your app_.)

##Ionic and Cordova
In case of Ionic and Cordova, the scanner can detect [jasmine](https://github.com/jasmine/jasmine) and [karma-jasmine](https://github.com/karma-runner/karma-jasmine) tests. Using these testing frameworks your workflows will look like this:

<pre><code>  primary:
    steps:
    - activate-ssh-key:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone:
    - script:
        title: Do anything with Script step
    - npm:
        inputs:
        - command: install
    - karma-jasmine-runner: # or jasmine-runner
    - deploy-to-bitrise-io:

  deploy:
    steps:
    - activate-ssh-key:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone:
    - script:
        title: Do anything with Script step
    - npm:
        inputs:
        - command: install
    - karma-jasmine-runner: # or jasmine-runner
    - generate-cordova-build-configuration:
    - cordova-archive: # or ionic-archive
        inputs:
        - platform: "$CORDOVA_PLATFORM"
        - target: emulator
    - deploy-to-bitrise-io:
</code></pre>

##React Native
In case of the React Native project type, __the scanner searches for a test script in your package.json file__.
This is what your workflows will look like:

<pre><code>  primary:
    steps:
    - activate-ssh-key:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone: {}
    - script:
        title: Do anything with Script step
    - install-react-native: {}
    - npm:
        inputs:
        - workdir: project
        - command: install
    - npm:
        inputs:
        - workdir: project
        - command: test
    - deploy-to-bitrise-io: {}

  deploy:
    steps:
    - activate-ssh-key:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone: {}
    - script:
        title: Do anything with Script step
    - install-react-native: {}
    - npm:
        inputs:
        - workdir: project
        - command: install
    - install-missing-android-tools: {}
    - gradle-runner:
        inputs:
        - gradle_file: $GRADLE_BUILD_FILE_PATH
        - gradle_task: assembleRelease
        - gradlew_path: $GRADLEW_PATH
    - certificate-and-profile-installer: {}
    - xcode-archive:
        inputs:
        - project_path: $BITRISE_PROJECT_PATH
        - scheme: $BITRISE_SCHEME
        - configuration: Release
    - deploy-to-bitrise-io: {}
</code></pre>

#Generating release outputs

For __Ionic and Cordova projects__ we created specific build steps (namely `cordova-archive` and `ionic-archive`) which use the framework's command line tools (Ionic and Cordova CLI) to build your project. Both Ionic and Cordova use the Cordova CLI tool to build the project, so you can control the release type with the Cordova build configuration file (build.json), which contains code signing settings for both iOS and Android projects. (Read more on our Discuss pages for [Cordova](https://discuss.bitrise.io/t/generating-release-outputs-for-cordova/2030?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30crossplatform) and [Ionic](https://discuss.bitrise.io/t/generating-release-outputs-for-ionic/2039?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30crossplatform) release builds.)

For __React Native__ we use our native iOS and Android build steps (`xcode-archive` and `gradle-runner`). Read more on our DevCenter for [iOS](http://devcenter.bitrise.io/ios/code-signing/?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30crossplatform) and [Android](http://devcenter.bitrise.io/android/code-signing/?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30crossplatform) code signing.

#Jump in!
[The scanner](https://github.com/bitrise-core/bitrise-init?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30crossplatform) and the steps are open source, so you can always jump in and see how we did it. If you find any issues let us know or even better, send us a pull request! :)

Happy coding! 🚀
