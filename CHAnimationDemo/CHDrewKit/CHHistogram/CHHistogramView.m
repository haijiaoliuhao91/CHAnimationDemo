//
//  CHHistogramView.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/11/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHHistogramView.h"
@interface CHHistogramView()
@property (strong ,nonatomic) UILabel *title;
@end
@implementation CHHistogramView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (void)initSubviews{
    _title = [[UILabel alloc]init];
    _textColor = [UIColor blackColor];
    _font = [UIFont systemFontOfSize:13];
    _lineWidth = 2;
}
- (void)show:(BOOL)animation{
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    if(_colors.count > 0 && _scales.count > 0 && _colors.count == _scales.count){
        _title.textColor = _textColor;
        _title.text = _name;
        _title.font = _font;
        _title.textAlignment = 1;
        _title.frame = CGRectMake(0, self.frame.size.height-20,self.frame.size.width, 20);
        _title.backgroundColor = self.backgroundColor;
        [_colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CAShapeLayer *shape = [CAShapeLayer layer];
            shape.lineWidth = _lineWidth;
            shape.strokeColor = obj.CGColor;
            UIBezierPath *path = [UIBezierPath bezierPath];
            CGFloat h = self.frame.size.height-20-2;
            CGFloat w = self.frame.size.width/2-(_scales.count/2*(_lineWidth+1)*idx);
            [path moveToPoint:CGPointMake(w, h)];
            [path addLineToPoint:CGPointMake(w,0+h*[_scales[idx] floatValue])];
            shape.path = path.CGPath;
            [self.layer addSublayer:shape];
            if (animation) {
                CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
                animation.fromValue = @(0);
                animation.toValue = @(1);
                animation.duration = 1.0;
                [shape addAnimation:animation forKey:@"Line"];
            }
        }];
        [self addSubview:_title];
    }else{
        NSLog(@"%s %d显示的数据不匹配",__PRETTY_FUNCTION__,__LINE__);
    }

    
    
    
}

@end
