//
//  CHFlipButton.m
//  CHAnimationDemo
//
//  Created by Chausson on 2017/1/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "CHFlipButton.h"
@interface CHFlipButton()
@property (strong ,nonatomic) UIImageView *content;
@end
@implementation CHFlipButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize
{
    _content = [[UIImageView alloc]init];
    [self addSubview:_content];
    //使用Auto Layout约束，禁止将Autoresizing Mask转换为约束
    [_content setTranslatesAutoresizingMaskIntoConstraints:NO];
    //layout 子view
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant3 = [NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant4 = [NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    //把约束添加到父视图上
    NSArray *array = [NSArray arrayWithObjects:constrant1, constrant2, constrant3, constrant4, nil];
    [self addConstraints:array];
}
- (void)start{
    [self startWithBlcok:nil duration:1.0];
}
- (void)startWithBlcok:(void(^)(CHFlipButton *))completion
              duration:(NSTimeInterval )duration{
    if (!self.isAnimation) {
        _animation = YES;
        CGContextRef context =UIGraphicsGetCurrentContext();
        
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [UIView setAnimationDuration:duration];
        //    [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView:parentView cache:YES];  //从上向下
        
        // [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:parentView cache:YES];   //从下向上
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.content cache:YES];//从左向右
        
        //     [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:parentView cache:YES];//从右向左
        
        [UIView setAnimationRepeatCount:MAXFLOAT];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(stopAnimating)];
        //当动画执行结束，执行animationFinished方法
        
        [UIView commitAnimations];
        
        if (completion) {
            completion(self);
        }
    }
  
}
- (void)stop{
    [self stopCompletion:nil];
}
- (void)stopCompletion:(void(^)(CHFlipButton *))completion{
    _animation = NO;
    [_content.layer removeAllAnimations];
    if (completion) {
        completion(self);
    }
}
- (void)setImage:(UIImage *)image{
    if (![NSThread isMainThread]) {
        NSLog(@"当前线程不是主线程调用 filButton %s %d",__PRETTY_FUNCTION__,__LINE__);
        dispatch_async(dispatch_get_main_queue(), ^{
            _content.image = image;

        });
    }else{
        _content.image = image;

    }

}
@end
