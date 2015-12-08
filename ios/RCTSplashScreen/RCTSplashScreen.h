//
//  RCTSplashScreen.h
//  RCTSplashScreen
//
//  Created by fangyunjiang on 15/11/20.
//  Copyright (c) 2015年 remobile. All rights reserved.
//

#import "RCTBridgeModule.h"
#import "RCTRootView.h"

@interface RCTSplashScreen : NSObject <RCTBridgeModule>

+ (void)show:(RCTRootView *)v;

@end
