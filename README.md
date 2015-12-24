# React Native SplashScreen (remobile)
A splashscreen for react-native, hide when application loaded

## Installation
```sh
npm install @remobile/react-native-splashscreen --save
```
### Installation (iOS)
* Drag RCTSplashScreen.xcodeproj to your project on Xcode.
* Click on your main project file (the one that represents the .xcodeproj) select Build Phases and drag libRCTSplashScreen.a from the Products folder inside the RCTSplashScreen.xcodeproj.
* Look for Header Search Paths and make sure it contains $(SRCROOT)/../../../react-native/React as recursive.

* In your project, Look for Header Search Paths and make sure it contains $(SRCROOT)/../node_modules/@remobile/react-native-splashscreen/ios/RCTSplashScreen

* delete your project's LaunchScreen.xib
* Dray SplashScreenResource to your project [if you want change image, replace splash.png]

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
project(':react-native-splashscreen').projectDir = new File(rootProject.projectDir, '../node_modules/@remobile/react-native-splashscreen/android')
```

* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':react-native-splashscreen')
}
```
* if you want change image, replace res/drawable/splash.png

* register module (in MainActivity.java)

```java
import com.remobile.splashscreen.*;  // <--- import

public class MainActivity extends Activity implements DefaultHardwareBackBtnHandler {
  ......
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    mReactInstanceManager = ReactInstanceManager.builder()
      .setApplication(getApplication())
      .setBundleAssetName("index.android.bundle")
      .setJSMainModuleName("index.android")
      .addPackage(new MainReactPackage())
      .addPackage(new RCTSplashScreenPackage(this))              // <------ add here
      .setUseDeveloperSupport(BuildConfig.DEBUG)
      .setInitialLifecycleState(LifecycleState.RESUMED)
      .build();

    mReactRootView.startReactApplication(mReactInstanceManager, "ExampleRN", null);

    setContentView(mReactRootView);
  }

  ......
}
```

### Screencasts
![gif](https://github.com/remobile/react-native-splashscreen/blob/master/screencasts/splash.gif)

## Usage

### Example
```js
'use strict';
var React = require('react-native');
var {
    AppRegistry,
    View,
    Text,
} = React;
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


### methods
- hide() hide SplashScreen
