package com.player.playerView;


import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.common.MapBuilder;

import com.facebook.react.uimanager.ThemedReactContext;

import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.uimanager.events.RCTEventEmitter;
import com.tencent.liteav.demo.play.SuperPlayerView;

import java.util.HashMap;
import java.util.Map;


public class ZZPlayerViewManager extends ViewGroupManager {
    private ThemedReactContext reactContext;
    private static final String PLAY = "play"; // 交互方法名
    private static final String PLAY_ID = "play"; // 交互命令ID
    private static final String STOP = "stop"; // 交互方法名
    private static final String STOP_ID = "stop"; // 交互命令ID
    private static final String PAUSE = "pause"; // 交互方法名
    private static final String PAUSE_ID = "pause"; // 交互命令ID
    private static final String RESUME = "resume"; // 交互方法名
    private static final String RESUME_ID = "resume"; // 交互命令ID


    @NonNull
    @Override
    public String getName() {
        return "BRPlayerView";
    }

    @Override
    public boolean needsCustomLayoutForChildren() {
        return true;
    }

    @NonNull
    @Override
    protected View createViewInstance(@NonNull ThemedReactContext reactContext) {
        this.reactContext = reactContext;
        ZZPlayerView zzPlayerView = new ZZPlayerView(reactContext.getCurrentActivity());
        zzPlayerView.superPlayerView.setPlayerViewCallback(new SuperPlayerView.OnSuperPlayerViewCallback() {
            @Override
            public void onStartFullScreenPlay() {
               ZZPlayerViewManager.this.fullScreenChange(zzPlayerView.getId(),true);


            }

            @Override
            public void onStopFullScreenPlay() {
                ZZPlayerViewManager.this.fullScreenChange(zzPlayerView.getId(),false);

            }

            @Override
            public void onClickFloatCloseBtn() {

            }

            @Override
            public void onClickSmallReturnBtn() {

            }

            @Override
            public void onStartFloatWindowPlay() {

            }
        });

        return zzPlayerView;
    }
    @ReactProp(name = "url")
    public void setVideoPath(final ZZPlayerView playerView, String url) {

        playerView.url = url;
    }

    @Nullable
    @Override
    public Map<String, String> getCommandsMap() {
        Map<String, String> map = new HashMap<String, String>();
        map.put(PLAY, PLAY_ID);
        map.put(STOP, STOP_ID);
        map.put(PAUSE, PAUSE_ID);
        map.put(RESUME, RESUME_ID);
        return map;
    }

    @Override
    public void receiveCommand(@NonNull View root, String commandId, @Nullable ReadableArray args) {
        ZZPlayerView playerView = (ZZPlayerView)root;
        switch (commandId) {
            case PLAY_ID:
                playerView.play();
                break;
            case STOP_ID:
                playerView.stop();
                break;
            case PAUSE_ID:
                playerView.pause();
                break;
            case RESUME_ID:
                playerView.resume();
                break;
        }
    }

    @Nullable
    @Override
    public Map getExportedCustomBubblingEventTypeConstants() {
        return MapBuilder.builder()
                .put(
                        "fullScreenChange",
                        MapBuilder.of(
                                "phasedRegistrationNames",
                                MapBuilder.of("bubbled", "onFullScreen")))

                .build();
    }

    private void fullScreenChange(int id,boolean flag){
        WritableMap map = Arguments.createMap();
        map.putBoolean("isFullPlay",flag);
        reactContext.getJSModule(RCTEventEmitter.class).receiveEvent(
                id,
                "fullScreenChange",
                map);

    }


}
