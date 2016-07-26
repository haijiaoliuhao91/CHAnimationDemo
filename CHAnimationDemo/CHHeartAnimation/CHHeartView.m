//
//  CHHeartView.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/7/9.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <pop/POP.h>
#import "CHHeartView.h"
@interface CHHeartView()
@property(nonatomic) UIImageView *imageView;
@property(nonatomic) NSTimer *graceTimer;

@end

@implementation CHHeartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return self;
}

#pragma mark - Property Setters

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
    _image = image;
}

- (void)startAnimation{
    if (self.delegate && [self.delegate respondsToSelector:@selector(willStartAnimation)]) {
        [self.delegate didStopAnimation];
    }
    __weak typeof(self) weakSelf = self;
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.75, 0.75)];
    scaleAnimation.springBounciness = 1.5f;
    scaleAnimation.springSpeed = 0.4;
    //    scaleAnimation.repeatForever = YES;
    POPSpringAnimation *scaleAnimation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation2.toValue = [NSValue valueWithCGSize:CGSizeMake(1.05,1.05)];
    scaleAnimation2.springBounciness = 4.f;
    scaleAnimation2.springSpeed = 0.8;
    
    
    POPSpringAnimation *scaleAnimation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation3.toValue = [NSValue valueWithCGSize:CGSizeMake(0.9, 0.9)];
    scaleAnimation3.springBounciness = 5.f;
    scaleAnimation3.repeatCount = 2;
    scaleAnimation3.springSpeed = 1.0;
    [scaleAnimation3 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (finished) {
            [strongSelf.imageView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        }
        
    }];
    
    [scaleAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (finished) {
            [strongSelf.layer pop_addAnimation:scaleAnimation2 forKey:@"scaleAnimation2"];
            [strongSelf.layer pop_addAnimation:scaleAnimation3 forKey:@"scaleAnimation3"];
        }
    }];
    
    self.graceTimer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(spring) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.graceTimer forMode:NSDefaultRunLoopMode];
    
    
    [self.imageView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}
- (void)spring{
    for (NSString *key in self.imageView.layer.pop_animationKeys) {
        POPAnimation *animation = [self.imageView.layer pop_animationForKey:key];
        [animation setPaused:YES];
    }
    
    POPSpringAnimation *scaleAnimation4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation4.toValue = [NSValue valueWithCGSize:CGSizeMake(0.75, 0.75)];
    scaleAnimation4.springBounciness = 3.f;
    scaleAnimation4.springSpeed = 0.8f;
    [scaleAnimation4 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            for (NSString *key in self.imageView.layer.pop_animationKeys) {
                POPAnimation *animation = [self.imageView.layer pop_animationForKey:key];
                [animation setPaused:NO];
            }
        }
    }];
    [self.imageView.layer pop_addAnimation:scaleAnimation4 forKey:@"scaleAnimation4"];
    
    
    
}
- (void)removeFromSuperview{
    if (self.graceTimer) {
        [self.graceTimer invalidate];
    }
    [super removeFromSuperview];
}
- (void)stopAnimation{
    if (self.graceTimer) {
        [self.graceTimer invalidate];
    }
    for (NSString *key in self.imageView.layer.pop_animationKeys) {
        POPAnimation *animation = [self.imageView.layer pop_animationForKey:key];
        [animation setPaused:YES];
    }
    [self.imageView.layer  pop_removeAllAnimations];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didStopAnimation)]) {
        [self.delegate didStopAnimation];
    }
    
}
- (void)dealloc{
    
}
@end
