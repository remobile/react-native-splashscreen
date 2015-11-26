//
//  CRTSplashScreen.m
//  CRTSplashScreen
//
//  Created by fangyunjiang on 15/11/20.
//  Copyright (c) 2015年 remobile. All rights reserved.
//

#import "CRTSplashScreen.h"
#import "RCTConvert.h"

static RCTRootView *rootView = nil;

@interface CRTSplashScreen()

@end

@implementation CRTSplashScreen

RCT_EXPORT_MODULE(SplashScreen)

+ (void)show:(RCTRootView *)v {
    rootView = v;
    rootView.loadingViewFadeDelay = 1;
    rootView.loadingViewFadeDuration = 0.5;
    UIImageView *view = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.image = [UIImage imageNamed:@"splash"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:rootView  name:RCTContentDidAppearNotification object:rootView];
    
    [rootView setLoadingView:view];
}


RCT_EXPORT_METHOD(hide:(NSDictionary *)options) {
    NSTimeInterval duration = [RCTConvert float:options[@"duration"]] ?: 1;

    if (!rootView) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),
                   ^{
                       [UIView transitionWithView: rootView
                                         duration:1
                                          options:UIViewAnimationOptionTransitionCrossDissolve
                                       animations:^{
                                           rootView.loadingView.hidden = YES;
                                       } completion:^(__unused BOOL finished) {
                                           [rootView.loadingView removeFromSuperview];
                                       }];
                   });
}

@end
