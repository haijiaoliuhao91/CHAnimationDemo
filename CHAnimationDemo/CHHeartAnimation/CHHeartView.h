//
//  CHHeartView.h
//  CHAnimationDemo
//
//  Created by Chausson on 16/7/9.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHHeartView;
@protocol CHHeartViewDelegate <NSObject>
- (void )willStartAnimation;
- (void )didStopAnimation;
@end
@interface CHHeartView : UIControl

@property(nonatomic) UIImage *image;
@property(nonatomic ,weak) id <CHHeartViewDelegate>delegate;

- (void)startAnimation;

- (void)stopAnimation; 

@end
