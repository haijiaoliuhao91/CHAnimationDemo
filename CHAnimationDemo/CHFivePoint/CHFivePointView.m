//
//  CHFivePointView.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHFivePointView.h"
#import <pop/POP.h>
@implementation CHFivePointView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
//// 绘制半圆路径Demo
//- (void)drawRect:(CGRect)rect {
//    UIColor *blue = [UIColor blueColor];
//    [blue set];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//    [path moveToPoint:CGPointMake(self.frame.size.width-50, self.frame.size.height/2)];
//    [path addArcWithCenter:center radius:self.frame.size.width/3 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(90) clockwise:YES];
//    [path addArcWithCenter:center radius:self.frame.size.width/3 startAngle:DEGREES_TO_RADIANS(90) endAngle:DEGREES_TO_RADIANS(180) clockwise:YES];
//    [path addArcWithCenter:center radius:self.frame.size.width/3 startAngle:DEGREES_TO_RADIANS(180) endAngle:DEGREES_TO_RADIANS(-90) clockwise:YES];
//    [path addArcWithCenter:center radius:self.frame.size.width/3 startAngle:DEGREES_TO_RADIANS(-90) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];
//
//    CAShapeLayer *shape= [CAShapeLayer layer];
//    shape.path = path.CGPath;
//    shape.lineWidth = 2;
//    shape.fillColor = [UIColor clearColor].CGColor;
//    shape.strokeColor = blue.CGColor;
//    POPBasicAnimation *panimation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
//    panimation.fromValue = @(0);
//    panimation.toValue = @(1);
//    panimation.duration = 1.5;
//    panimation.repeatForever = YES;
//    [shape pop_addAnimation:panimation forKey:@"p"];
//    POPBasicAnimation *panimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeStart];
//    panimation2.fromValue = @(-1);
//    panimation2.toValue = @(1);
//    panimation2.duration = 1.5;
//    panimation2.repeatForever = YES;
//    [shape pop_addAnimation:panimation2 forKey:@"r"];
//    [self.layer addSublayer:shape];
//
//}

// 绘制五角星Demo
- (void)drawRect:(CGRect)rect {
    
    UIColor *green = [UIColor greenColor];
    [green set];
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 4.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(self.frame.size.width/2, 0.0)];
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(self.frame.size.width/5, self.frame.size.height)];
    [aPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/3)];
    [aPath addLineToPoint:CGPointMake(0, self.frame.size.height/3)];
    [aPath addLineToPoint:CGPointMake( self.frame.size.width/5*4 ,self.frame.size.height )];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    [aPath stroke];//Draws line 根据坐标点连线
    // 五角星
    
    // 左边路径
    UIBezierPath* lPath = [UIBezierPath bezierPath];
    lPath.lineWidth = 4.0;
    lPath.lineCapStyle = kCGLineCapRound; //线条拐角
    //    lPath.lineJoinStyle = kCGLineCapRound; //终点处理
    // Set the starting point of the shape.
    [lPath moveToPoint:CGPointMake(self.frame.size.width/2, 0.0)];
    // Draw the lines
    [lPath addLineToPoint:CGPointMake(self.frame.size.width/5, self.frame.size.height)];
    [lPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/3)];
    [lPath addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/3)];
    
    // 右边路径
    UIBezierPath* rPath = [UIBezierPath bezierPath];
    rPath.lineWidth = 4.0;
    rPath.lineCapStyle = kCGLineCapRound; //线条拐角
    rPath.lineJoinStyle = kCGLineCapRound; //终点处理
    // Set the starting point of the shape.
    [rPath moveToPoint:CGPointMake(self.frame.size.width/2, 0.0)];
    // Draw the lines
    [rPath addLineToPoint:CGPointMake( self.frame.size.width/5*4 ,self.frame.size.height )];
    [rPath addLineToPoint:CGPointMake(0, self.frame.size.height/3)];
    [rPath addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/3)];
    
    
    
    
    CAShapeLayer *lshape = [CAShapeLayer layer];
    lshape.path = lPath.CGPath;
    lshape.strokeColor = [UIColor redColor].CGColor;
    lshape.fillColor = [UIColor clearColor].CGColor;
    lshape.backgroundColor = [UIColor yellowColor].CGColor;
    
    CAShapeLayer *rshape = [CAShapeLayer layer];
    rshape.path = rPath.CGPath;
    rshape.strokeColor = [UIColor redColor].CGColor;
    rshape.fillColor = [UIColor clearColor].CGColor;
    rshape.backgroundColor = [UIColor yellowColor].CGColor;
    
    POPBasicAnimation *panimation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    panimation.fromValue = @(0);
    panimation.toValue = @(1);
    panimation.duration = 3.5;
    panimation.repeatForever = YES;
    panimation.autoreverses = YES;
    
    POPBasicAnimation *panimation2 =[POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerLineWidth];
    panimation2.fromValue = @(aPath.lineWidth);
    panimation2.toValue = @(aPath.lineWidth*2);
    panimation2.duration = 3.5;
    panimation2.repeatForever = YES;
    panimation2.autoreverses = YES;
    [lshape pop_addAnimation:panimation forKey:@"p"];
    [lshape pop_addAnimation:panimation2 forKey:@"p2"];
    [rshape pop_addAnimation:panimation forKey:@"p"];
    [rshape pop_addAnimation:panimation2 forKey:@"p2"];
    
    [self.layer addSublayer:lshape];
    [self.layer addSublayer:rshape];
    
    
}

@end
