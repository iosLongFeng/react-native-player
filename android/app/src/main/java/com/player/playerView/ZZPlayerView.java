package com.player.playerView;

import android.content.Context;
import android.view.Choreographer;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import com.player.R;
import com.tencent.liteav.demo.play.SuperPlayerGlobalConfig;
import com.tencent.liteav.demo.play.SuperPlayerModel;
import com.tencent.liteav.demo.play.SuperPlayerView;
import com.tencent.rtmp.TXLiveConstants;


public class ZZPlayerView extends RelativeLayout {
    public SuperPlayerView superPlayerView;
    public String url;
    private ViewGroup rootView;

    public ZZPlayerView(Context context) {
        super(context);
        rootView = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.player_view, this);
        superPlayerView = rootView.findViewById(R.id.my_SuperPlayerView);
        SuperPlayerGlobalConfig superPlayerGlobalConfig = SuperPlayerGlobalConfig.getInstance();
        superPlayerGlobalConfig.enableFloatWindow = false;
        superPlayerGlobalConfig.renderMode = TXLiveConstants.RENDER_MODE_FULL_FILL_SCREEN;


    }

    @Override
    public void requestLayout() {
        super.requestLayout();
      this.reLayout();
    }

    public   void reLayout(){

        setupLayoutHack();

    }

    void setupLayoutHack() {

        Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() {
            @Override
            public void doFrame(long frameTimeNanos) {
                manuallyLayoutChildren();
                getViewTreeObserver().dispatchOnGlobalLayout();
                Choreographer.getInstance().postFrameCallback(this);
            }
        });
    }

    void manuallyLayoutChildren() {
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            child.measure(MeasureSpec.makeMeasureSpec(getMeasuredWidth(), MeasureSpec.EXACTLY),
                    MeasureSpec.makeMeasureSpec(getMeasuredHeight(), MeasureSpec.EXACTLY));
            child.layout(0, 0, child.getMeasuredWidth(), child.getMeasuredHeight());
        }
    }


    public void play(){
        try {
            SuperPlayerModel superPlayerModel = new SuperPlayerModel();
            superPlayerModel.url = this.url;
            superPlayerView.playWithModel(superPlayerModel);
        }catch (Exception e){

        }

    }
    public void pause(){
        superPlayerView.onPause();
    }
    public void resume(){
        superPlayerView.onResume();
    }
    public void stop(){
        superPlayerView.resetPlayer();
    }

}
