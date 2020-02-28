//
//  TestViewController.m
//  Player
//
//  Created by ns on 2020/2/26.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "TestViewController.h"
#import <SuperPlayer/SuperPlayer.h>
@interface TestViewController ()
@property(nonatomic,strong)SuperPlayerView* playerView;
@end

@implementation TestViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  UIView* fatherView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
  [self.view addSubview:fatherView];
  
  _playerView = [[SuperPlayerView alloc] init];
   _playerView.controlView.hidden = YES;
  // 设置代理，用于接受事件
  // _playerView.delegate = self;
  // 设置父 View，_playerView 会被自动添加到 holderView 下面
  _playerView.fatherView = fatherView;
  
//  SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
//  // 设置播放地址，直播、点播都可以
//  playerModel.videoURL = @"http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4";
//  // 开始播放
//  [_playerView playWithModel:playerModel];
  NSArray* arr = @[@"play",@"pause",@"resume",@"stop"];
  for(int i=0;i<4;i++){
    UIButton* but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.backgroundColor = [UIColor blueColor];
    [but1 setTitle:arr[i] forState:UIControlStateNormal];
    but1.frame = CGRectMake(0, 350+i*60, 100, 50);
    but1.tag = i+10;
    [but1 addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
  }
  
}

-(void)playAction:(UIButton*)but{
  switch (but.tag) {
    case 10:{
      SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
      playerModel.videoURL = @"http://200024424.vod.myqcloud.com/200024424_709ae516bdf811e6ad39991f76a4df69.f20.mp4";
      // 开始播放
      [_playerView playWithModel:playerModel];
    }
      
      break;
    case 11:
      [_playerView pause];
      break;
    case 12:
      [_playerView resume];
      break;
    case 13:
      [_playerView resetPlayer];
      break;
      
    default:
      break;
  }
  
}

@end
