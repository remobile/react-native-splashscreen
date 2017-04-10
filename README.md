# React Native SplashScreen (remobile)
A splashscreen for react-native, hide when application loaded

## Installation
```sh
npm install @remobile/react-native-splashscreen --save
```
### Installation (iOS)
* Drag RCTSplashScreen.xcodeproj to your project on Xcode.
* Click on your main project file (the one that represents the .xcodeproj) select Build Phases and drag libRCTSplashScreen.a from the Products folder inside the RCTSplashScreen.xcodeproj.

* In AppDelegate.m
```objc
...
#import "RCTSplashScreen.h" //<--- import
...
RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"KitchenSink"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  [RCTSplashScreen show:rootView]; //<--- add show SplashScreen

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [[UIViewController alloc] init];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
```


### Installation (Android)
```gradle
...
include ':react-native-splashscreen'
project(':react-native-splashscreen').projectDir = new File(settingsDir, '../node_modules/@remobile/react-native-splashscreen/android')
```

* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':react-native-splashscreen')
}
```

* register module (in MainApplication.java)

```java
......
import com.remobile.splashscreen.RCTSplashScreenPackage;  // <--- import

......

@Override
protected List<ReactPackage> getPackages() {
   ......
   new RCTSplashScreenPackage(MainActivity.activity, true),            // <------ add here [the seconde params is translucent]
   ......
}

```

* register module (in MainActivity.java)

```java
public class MainActivity extends ReactActivity {
    public static Activity activity;           // <------ add here
    ......
    @Override
    protected String getMainComponentName() {
        activity = this;           // <------ add here
        ......
    }
}
```

### Screencasts
![gif](https://github.com/remobile/react-native-splashscreen/blob/master/screencasts/splash.gif)

## Usage

### Example
```js
'use strict';
var React = require('react');
var ReactNative = require('react-native');
var {
    AppRegistry,
    View,
    Text,
} = ReactNative;
var SplashScreen = require('@remobile/react-native-splashscreen');

var KitchenSink = React.createClass({
    componentDidMount: function() {
        SplashScreen.hide();
    },
    render() {
        return(
            <View>
                <Text>
                    fangyunjiang is a good developer!
                </Text>
            </View>
        );
    }
});

AppRegistry.registerComponent('KitchenSink', () => KitchenSink);
```

### constants
- `translucent` is translucent enable
### methods
- `hide()` hide SplashScreen

### genarate splash with ffmpeg
* you must install ffmpeg first

```sh
#!/bin/bash

src="${1-./img/splash.png}"

ffmpeg -i ${src} -s 640x1136 ../ios/CardC/splash/Default-568h@2x~iphone.png -y
ffmpeg -i ${src} -s 750x1334 ../ios/CardC/splash/Default-667h.png -y
ffmpeg -i ${src} -s 1242x2208 ../ios/CardC/splash/Default-736h.png -y
ffmpeg -i ${src} -s 640x960 ../ios/CardC/splash/Default@2x~iphone.png -y
ffmpeg -i ${src} -s 320x480 ../ios/CardC/splash/Default~iphone.png -y
ffmpeg -i ${src} -s 320x568 ../ios/CardC/splash/splash.png -y
mkdir -p ../android/app/src/main/res/drawable
cp ../ios/CardC/splash/splash.png ../android/app/src/main/res/drawable/splash.png
```
* you can also see https://github.com/remobile/react-native-template/blob/master/project/tools

### see detail use
* https://github.com/remobile/react-native-template

### the best way use SplashScreen in splash.js in [example](https://github.com/remobile/react-native-splashscreen/blob/master/examples/splash.js)
