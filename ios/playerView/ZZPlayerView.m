//
//  ZZPlayerView.m
//  Player
//
//  Created by ns on 2020/2/26.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ZZPlayerView.h"
#import <SuperPlayer/SuperPlayer.h>
@interface ZZPlayerView ()<SuperPlayerDelegate>
@property(nonatomic,strong)SuperPlayerView* playerView;
@end
@implementation ZZPlayerView
-(instancetype)init:(NSCoder *)aDecoder{
  if(self = [super initWithCoder:aDecoder]){
    [self loadViews];
  }
  
  return self;
  
}

-(instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    [self loadViews];
  }
  return self;
}
-(void)loadViews{
  _playerView = [[SuperPlayerView alloc] init];
  _playerView.fatherView = self;
  SuperPlayerViewConfig* config = [[SuperPlayerViewConfig alloc] init];
  config.renderMode = RENDER_MODE_FILL_SCREEN;
  _playerView.playerConfig = config;
  _playerView.controlView.hidden = YES;
  _playerView.delegate= self;

  

}
-(void)start{
  
  SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
  playerModel.videoURL = _url;
  [_playerView playWithModel:playerModel];
  
  
}
- (void)pause{
  [_playerView pause];
}
- (void)resume{
  [_playerView resume];
}
- (void)stop{
  [_playerView resetPlayer];
}

#pragma mark - SuperPlayerDelegate
-(void)superPlayerFullScreenChanged:(SuperPlayerView *)player{
  if(player.isFullScreen){
    SPDefaultControlView* controlView = (SPDefaultControlView*)player.controlView;
    controlView.captureBtn.hidden=YES;
    controlView.moreBtn.hidden=YES;
    controlView.danmakuBtn.hidden=YES;
  }
}

@end
