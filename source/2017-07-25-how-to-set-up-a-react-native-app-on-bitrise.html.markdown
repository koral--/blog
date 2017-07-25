---
title: How to set up a React Native app on Bitrise
date: 2017-07-25 12:12 UTC
tags: how-to
authors: Anna Bátki|anna.batki@bitrise.io
overlay: /images/react_native_banner-min.png
---

Automating React Native apps on Bitrise? Sure thing! Let's see how! 🤖

1. Log in to Bitrise and __click `+Add new app`__ on your Dashboard!

2. __Connect your repository__ from your connected source code provider or add it manually.

    ![Connect your repository](images/react-native-1.png)

3. __Setup repository access__ (See [DevCenter for detailed explanation](http://devcenter.bitrise.io/getting-started/create-your-first-app-on-bitrise/#2-setup-repository-access?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30reactnative)!)

    ![Setup repository access](images/react-native-2.png)

4. __Validation setup__: choose a branch for our scanner, this will help automation. How about a cuppa coffee while we are scanning your app? :)

    ![Validation setup](images/react-native-3.png)

5. __Project build configuration__: our scanner will most likely have chosen React Native for your app. Yay! :) Select Scheme name!

    ![Project build configuration](images/react-native-4.png)

6. __Selected project build configuration__: review and Confirm settings!

    ![CSelected project build configuration](images/react-native-5.png)

7. __Webhook setup__: register a Webhook so that Bitrise can automatically start a build every time you push code into your repository.

    ![Webhook setup](images/react-native-6.png)

8. __Observe your first build!__ Well done! ✨

    ![Observe your first build!](images/react-native-7.png)

9. After your first green build, now you are ready to __learn some more about deployment__, click on the blue box! For even more info, go to the [DevCenter](http://devcenter.bitrise.io/?utm_source=bitriseblog&utm_medium=web&utm_campaign=17w30reactnative)!

    ![Set up deployment to your devices!](images/react-native-8.png)

Happy coding! 🚀
