package com.remobile.splashscreen;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import android.app.Activity;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.JavaScriptModule;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

public class RCTSplashScreenPackage implements ReactPackage {
    private Activity activity;
    private boolean translucent;

    public RCTSplashScreenPackage(Activity activity, boolean translucent) {
        super();
        this.activity = activity;
        this.translucent = translucent;
    }


    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        return Arrays.<NativeModule>asList(
                new RCTSplashScreen(reactContext, activity, translucent)
        );
    }

    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Arrays.<ViewManager>asList();
    }
}
