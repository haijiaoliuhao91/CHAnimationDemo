//
//  CHRadar.h
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHRadar;
@protocol CHRadarDelegate <NSObject>
@optional
- (void)ch_radarDidStoped;
- (void)ch_radarWillStart;

@end
@interface CHRadar : UIView
@property (strong ,nonatomic) UIImage *image;
@property (strong ,nonatomic) UIColor *radarColor; // If not set color ,defult Color is blue;
@property (assign ,nonatomic) CGFloat animationDuration; // If not set duration ,defult duration is 2.0f;
@property (weak ,nonatomic) id <CHRadarDelegate>delegate;

- (void)startAnimation; // defult start usual is by tap action ,but there is a switch  to control the animation

- (void)stopAnimaition; // stop Animation
@end
