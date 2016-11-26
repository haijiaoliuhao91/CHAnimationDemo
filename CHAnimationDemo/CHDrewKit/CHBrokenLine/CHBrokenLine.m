//
//  CHBrokenLine.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/11/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHBrokenLine.h"
@interface CHBrokenLine ()
@end
@implementation CHBrokenLine
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points{
    if (self) {
        [self drew:points
             color:self.tintColor
         animaiton:NO
          duration:1.0f];
    }
    return self;
}

- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points
             animaiton:(BOOL)open
              duration:(NSTimeInterval )time{
    if (self) {
        [self drew:points
             color:self.tintColor
         animaiton:open
          duration:time];
    }
    return self;
}
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points
             animaiton:(BOOL)open{
    if (self) {
        [self drew:points
             color:self.tintColor
         animaiton:open
          duration:1.0f];
    }
    return self;
}
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points
                 color:(UIColor *)color
             animaiton:(BOOL)open
              duration:(NSTimeInterval )time{
    if (self) {
        if (points.count == 0) {
            return self;
        }
        CAShapeLayer *shape = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:points[0].point];
        for (CHBrokenPoint *p in points) {
            if (p.name.length > 0) {
                UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(p.point.x-20, p.point.y-30, 50, 15)];
                title.font = p.font;
                title.text = p.name;
                title.textColor = p.subColor;
                [self addSubview:title];
            }
            CAShapeLayer *round = [self roundLayer:color point:p.point];
   
            [path addLineToPoint:p.point];
        
            shape.lineWidth = p.lineWidth == 0 ? 2:p.lineWidth;
      

            [self.layer addSublayer:round];
        }
        shape.path = path.CGPath;
        shape.strokeColor = color.CGColor;
        shape.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:shape];
        // 增加动画
        if (open && time > 0) {
            CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.fromValue = @(0);
            animation.toValue = @(1);
            animation.duration = time;
            [shape addAnimation:animation forKey:@"BrokenLine"];
        }
  



    }
    return self;
}
- (CAShapeLayer *)roundLayer:(UIColor *)color
                       point:(CGPoint )aPoint{
    CAShapeLayer *round = [CAShapeLayer layer];
    round = [CAShapeLayer new];
    round.backgroundColor = color.CGColor;
    round.frame = CGRectMake(aPoint.x, aPoint.y, 8, 8);
    round.anchorPoint = CGPointMake(1.0, 1.0);
    round.cornerRadius = 8/2;
    return round;
}
- (CHBrokenLine *)clear{
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    return self;
}
@end
@implementation CHBrokenPoint
+ (CHBrokenPoint *)brokenPoint:(CGPoint )aPoint{
    CHBrokenPoint *point = [[CHBrokenPoint alloc]init];
    point.point = aPoint;
    return point;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _lineWidth = 2.0f;
        _tintColor = [UIColor blackColor];
        _subColor = [UIColor blackColor];
        _font = [UIFont systemFontOfSize:13];
    }
    return self;
}
@end
