package com.player.playerView;

import androidx.annotation.NonNull;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.List;

public class MyRNPackage implements ReactPackage {
    //桥接模块
    @NonNull
    @Override
    public List<NativeModule> createNativeModules(@NonNull ReactApplicationContext reactContext) {
        List<NativeModule> lists = new ArrayList<>();
        return lists;
    }
    //桥接ui
    @NonNull
    @Override
    public List<ViewManager> createViewManagers(@NonNull ReactApplicationContext reactContext) {
        List<ViewManager> viewManagerList = new ArrayList<>();
        viewManagerList.add(new ZZPlayerViewManager());
        return viewManagerList;
    }
}
