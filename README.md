# Mobile app for camping

<p align="center">
  <img src="https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png" width="11%"/>
  <img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/images/ikona.png?raw=true"/>
  <img src="https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png" width="14%"/>
</p>

This is a mobile camping app written in Flutter and Dart for a school term paper/seminar assignment.

Table of contents
=================

- [Prerequisites](#prerequisites)
- [Installation and running the APK](#installation-and-running-the-apk)
- [Purpose of the app](#purpose-of-the-app)
- [Gallery of screenshots](#application-screenshots)
- [Live presentation](#live-presentation-using-scrcpy)
- [Animated images of the application](#animated-images-of-the-application)

## Prerequisites

To properly run the application from Android Studio (or Visual Studio code) you have to install the
following:

- [Android Studio](https://developer.android.com/studio/install)
- [Flutter and Dart](https://flutter.dev/docs/get-started/install)
- Dart and Flutter plugins in Android Studio
- Install and configure your Android Emulator
- [Editor setup](https://flutter.dev/docs/get-started/editor)

If there are some problems with running the app you should check if every installation was done successfully.
You can do that by running `flutter doctor`. If the problem persists try running `flutter clean`. 
To generate an apk by yourself run `flutter build apk` and for ipa file `flutter build ios` (works only on Mac with Xcode).

## Installation and running the APK/IPA

Building of the artifacts is handled by two Github Action workflows - one for Android and one for iOS. 
To install the app directly to your Android mobile  device or Iphone go to repository releases and 
download the latest (pre)release APK/IPA file and then  install it on your mobile phone (if the apk 
installation fails switch to airplane mode and then try installing it again).

## Purpose of the app

The purpose of this application and repository is to create a DEMO mobile app for camping that would
provide the following activities:

- user login and registration
- list view of several camping venues with some information
- view of camps on Google Maps
- reservation of camps and camping spaces
- application to different activities inside the camp
- list of applications for camping activities
- adding your personal opinion based on your stay in camps
- user statistics (view your reservations and opinions)
- adding a new camp for camping owners
- modifying and erasing camps for camping owners
- adding, modifying and deleting camping spaces

The app has light mode in most activities, but on Android 10 (API 29) you can try to enable 
"Dark mode" display of apps and this will turn some views darker.

## Application Screenshots

Below you can see some application screenshots (taken on Pixel 3a API 28 emulator device and Pixel 3a XL API 29 - for testing dark mode):

<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/1.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/2.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/3.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/4.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/5.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/6.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/7.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/8.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/9.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/10.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/11.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/12.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/13.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/14.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/15.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/16.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/17.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/18.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/19.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/20.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/21.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/22.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/23.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/24.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/25.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/26.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/27.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/28.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/29.png?raw=true" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/30.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/31.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/32.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/33.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/34.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/35.png?raw=true" width="23%"></img>
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/slike_aplikacije/36.png?raw=true" width="23%"></img>

## Animated images of the application

Here you can observe some animated images (gifs) taken from this mobile app with some animations and interesting activities.

<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/inital.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/bar.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/login.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/forgot.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/onas.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/dark.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/items.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/calendar.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/map.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/slider.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/user.gif" width="23%"></img> 
<img src="https://github.com/mh-developer/Avtokampi-Mobile/blob/master/avtokampi/assets/gifs/favourites.gif" width="23%"></img> 

## Live Presentation using `scrcpy`

To present the Android App via PC, you can use [scrcpy](https://github.com/Genymobile/scrcpy) application
that runs on Linux, Windows and Mac.
