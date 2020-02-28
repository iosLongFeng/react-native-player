//
//  ZZPlayerView.h
//  Player
//
//  Created by ns on 2020/2/26.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZPlayerView : UIView
@property (nonatomic,copy) NSString *url;

-(void)start;
-(void)pause;
-(void)resume;
-(void)stop;

@end

NS_ASSUME_NONNULL_END
