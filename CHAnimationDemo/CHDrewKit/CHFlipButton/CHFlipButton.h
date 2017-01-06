//
//  CHFlipButton.h
//  CHAnimationDemo
//
//  Created by Chausson on 2017/1/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHFlipButton : UIControl
@property (readonly ,nonatomic, getter= isAnimation) BOOL animation;
@property (readonly ,nonatomic) UIImage *image;
- (void)start;
- (void)startWithBlcok:(void(^)(CHFlipButton *))completion
              duration:(NSTimeInterval )duration;
- (void)stop;
- (void)stopCompletion:(void(^)(CHFlipButton *))completion;
- (void)setImage:(UIImage *)image;
@end
