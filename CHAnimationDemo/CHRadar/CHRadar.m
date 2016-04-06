//
//  CHRadar.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHRadar.h"
#define KDuration 2.0f
@implementation CHRadar{
    UIImageView *_imageView;
    UITapGestureRecognizer *_tap;
    NSMutableArray *_sublayers;
    NSMutableArray *_timers;
    BOOL _isRippleOn;
    NSInteger _radarNumber;
    NSOperationQueue *_queue;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _radarNumber = 4;

        [self initailaiztionWithFrame:frame];
    }
    return self;
}
- (void)initailaiztionWithFrame:(CGRect)frame{
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _imageView.clipsToBounds = YES;
    _imageView.layer.cornerRadius = _imageView.frame.size.height/2;
    [self addSubview:_imageView];
    
    _imageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.layer.cornerRadius = self.frame.size.height/2;

    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:_tap];
}

- (void)handleTap:(UITapGestureRecognizer *)tap{
    if (!_isRippleOn) {
        [self start];
    }else{
        [self stop];
    }

}
- (void)setImage:(UIImage *)image{
    _imageView.image = image;
}
- (void)start{


         if ([self.delegate respondsToSelector:@selector(ch_radarWillStart)]) {
             [self.delegate ch_radarWillStart];
         }
        _isRippleOn = YES;
        _timers = [NSMutableArray arrayWithCapacity:_radarNumber];
        _sublayers = [NSMutableArray arrayWithCapacity:_radarNumber];
        _queue = [[NSOperationQueue alloc]init];
        for (int i = 0 ; i < _radarNumber; i ++) {
             float theInterval = self.animationDuration>0?self.animationDuration:KDuration;
             theInterval = theInterval/4 + i/2;
             if (i == 0) {
                 theInterval = 0 ;
             }
           NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(startQueue) userInfo:nil repeats:NO];
            [_timers addObject:timer];

         }
    

}
- (void)startQueue{
    if (_queue) {
         @synchronized(self){
        NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self
                                                                               selector:@selector(addAnimationSubview)
                                                                                object:nil];
        [_queue addOperation:operation];
         }
    }
}
- (void)addAnimationSubview{

    UIColor *stroke = _radarColor ? _radarColor : [UIColor blueColor];
    
    CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:self.layer.cornerRadius];
    
    // accounts for left/right offset and contentOffset of scroll view
    CGPoint shapePosition = [self convertPoint:self.center fromView:nil];
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path.CGPath;
    circleShape.position = shapePosition;
    circleShape.fillColor = stroke.CGColor;
    circleShape.opacity = 0;
    circleShape.strokeColor = [UIColor clearColor].CGColor;
    circleShape.lineWidth = 0;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.layer addSublayer:circleShape];
        [circleShape addAnimation:[self animationGroup] forKey:@"radar"];
    });

    [_sublayers addObject:circleShape];
}
- (CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3.5, 3.5, 1)];
    return scaleAnimation;
}
- (CABasicAnimation *)alphaAnimation{
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @0.5f;
    alphaAnimation.toValue = @0.15f;
    return alphaAnimation;
}
- (CAAnimationGroup *)animationGroup{
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[[self scaleAnimation],[self alphaAnimation]];
    animation.duration = self.animationDuration>0?self.animationDuration:KDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [animation setRepeatCount:MAXFLOAT];

    return animation;
}
- (void)stop{
     @synchronized(self){
         for (CAShapeLayer *shape in _sublayers) {
             [shape removeFromSuperlayer];
         }
         for (NSTimer *timer in _timers) {
             [timer invalidate];
         }
         [_queue cancelAllOperations];
         _timers = nil;
         _sublayers = nil;
         _queue = nil;
         _isRippleOn = NO;
         if ([self.delegate respondsToSelector:@selector(ch_radarDidStoped)]) {
             [self.delegate ch_radarDidStoped];
         }
     }
 
}
- (void)stopAnimaition{
    [self stop];
}
- (void)dealloc{
    
}
@end
