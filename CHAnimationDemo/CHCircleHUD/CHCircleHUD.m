//
//  CHCircleHUD.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/8.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCircleHUD.h"
#import <pop/POP.h>
//1。弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

//2。角度转弧度
// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
@implementation CHCircleHUD
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
// 绘制半圆路径Demo
- (void)drawRect:(CGRect)rect {
    UIColor *blue = [UIColor colorWithRed:5/255.0f green:154/255.0f blue:239/255.0f alpha:1];
    [blue set];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [path moveToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    [path addArcWithCenter:center radius:self.frame.size.width/2 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(180) clockwise:YES];
    [path addArcWithCenter:center radius:self.frame.size.width/2 startAngle:DEGREES_TO_RADIANS(180) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];
   // [path addArcWithCenter:center radius:self.frame.size.width/2 startAngle:DEGREES_TO_RADIANS(180) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];
   // [path addArcWithCenter:center radius:self.frame.size.width/2 startAngle:DEGREES_TO_RADIANS(-90) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];

    CAShapeLayer *shape= [CAShapeLayer layer];
    shape.path = path.CGPath;
    shape.lineWidth = 2;
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = blue.CGColor;
    POPBasicAnimation *panimation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    panimation.fromValue = @(0);
    panimation.toValue = @(1);
    panimation.duration = 1.25;
    panimation.repeatForever = YES;
    [shape pop_addAnimation:panimation forKey:@"p"];
    POPBasicAnimation *panimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeStart];
    panimation2.fromValue = @(-1);
    panimation2.toValue = @(1);
    panimation2.duration = 1.25;
    panimation2.repeatForever = YES;
    [shape pop_addAnimation:panimation2 forKey:@"r"];
    [self.layer addSublayer:shape];

}
@end
