//
//  DrewPieView.m
//  DrewPieDemo
//
//  Created by Chausson on 16/3/16.
//  Copyright © 2016年 Chausson. All rights reserved.
//
#import <pop/POP.h>
#import "CHDrewPieView.h"
//1。弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

//2。角度转弧度
// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface CHDrewPieView()
@property (strong ,nonatomic ) NSArray *scales;
@property (strong ,nonatomic ) NSArray *colors;
@end

@implementation CHDrewPieView
- (instancetype)initWithFrame:(CGRect)frame
                       scales:(NSArray *)scales
                       colors:(NSArray <UIColor *>*)colors{
    self = [super initWithFrame:frame];
    if (self) {
        // default backgroundColor clear color
        self.backgroundColor = [UIColor clearColor];
        _scales = scales;
        _colors = colors;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    // 拼接路径
    __block CGFloat startAngle = -90.0f;
    [_scales enumerateObjectsUsingBlock:^(NSNumber  *_Nonnull scale, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat startA = DEGREES_TO_RADIANS(startAngle);
        CGFloat angle =  360.0f*[scale doubleValue];
        startAngle  += angle;
        CGFloat endA = DEGREES_TO_RADIANS(startAngle);
        UIColor *color = (_colors.count > idx)?_colors[idx]:[UIColor blackColor];
 
        [self drewPieWithStartAngle:startA endAngle:endA fillColor:color];

    }];
    POPSpringAnimation *panimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
  //  panimation.fromValue = @(0);
    panimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(.0, 0)];
  //  panimation.toValue = @(1);
    panimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    panimation.springSpeed = 3.25;
    panimation.dynamicsTension = 10.f;
    panimation.springBounciness = 5.5f;
//    panimation.repeatForever = YES;
   // panimation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [self.layer pop_addAnimation:panimation forKey:@"p"];
    
}
// 根据条件绘制饼图
- (void)drewPieWithStartAngle:(CGFloat)start
                     endAngle:(CGFloat)end
                    fillColor:(UIColor *)color{

    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGFloat radius = self.frame.size.width/2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    shape.fillColor = color.CGColor;
    [self.layer addSublayer:shape];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.8);
    animation.toValue = @(0.2);
    animation.duration = 5.5;
    [shape addAnimation:animation forKey:@"begin"];
    

}

@end
