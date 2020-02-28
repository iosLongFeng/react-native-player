//
//  ZZPlayerViewManager.m
//  Player
//
//  Created by ns on 2020/2/26.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ZZPlayerViewManager.h"
#import "ZZPlayerView.h"
@implementation ZZPlayerViewManager
RCT_EXPORT_MODULE(BRPlayerView);

RCT_EXPORT_VIEW_PROPERTY(url, NSString*);


RCT_EXPORT_METHOD(play:(nonnull NSNumber *)reactTag) {
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    ZZPlayerView* player = [self getViewWithTag:reactTag];
    if (![player isKindOfClass:[ZZPlayerView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting LivePlayView, got: %@", player);
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        [player start];
      });
    }
  }];
}
RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)reactTag) {
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    ZZPlayerView* player = [self getViewWithTag:reactTag];
    if (![player isKindOfClass:[ZZPlayerView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting LivePlayView, got: %@", player);
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        [player pause];
      });
    }
  }];
}
RCT_EXPORT_METHOD(resume:(nonnull NSNumber *)reactTag) {
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    ZZPlayerView* player = [self getViewWithTag:reactTag];
    if (![player isKindOfClass:[ZZPlayerView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting LivePlayView, got: %@", player);
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        [player resume];
      });
    }
  }];
}

RCT_EXPORT_METHOD(stop:(nonnull NSNumber *)reactTag) {
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    ZZPlayerView* player = [self getViewWithTag:reactTag];
    if (![player isKindOfClass:[ZZPlayerView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting LivePlayView, got: %@", player);
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        [player stop];
      });
    }
  }];
}


#pragma mark - react
-(UIView *)view{
  
  return  [[ZZPlayerView alloc] init];
  
}


- (ZZPlayerView *) getViewWithTag:(NSNumber *)tag {
  
  UIView *view = [self.bridge.uiManager viewForReactTag:tag];
  return [view isKindOfClass:[ZZPlayerView class]] ? (ZZPlayerView *)view : nil;
  
}


- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}



@end
