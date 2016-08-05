//
//  CHLineWave.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/8/5.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHLineWave.h"

@implementation CHLineWave{
    
    BOOL fishFirstColl;
    CGFloat lineWaveHeight;
    CGFloat lineWaveWidth;
    CGFloat offsetX;
    
    CADisplayLink *waveDisplaylink;
    CAShapeLayer  *waveLayer;
    UIBezierPath *waveBoundaryPath;

}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        lineWaveHeight = self.frame.size.height ;
        lineWaveWidth  = frame.size.width;
        _lineWidth = 2.0f;
        _lineColor = [UIColor colorWithRed:0 green:0.722 blue:1 alpha:1];

    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        lineWaveHeight = self.frame.size.height ;
        lineWaveWidth  = self.frame.size.width;
        _lineWidth = 2.0f;
        _lineColor = [UIColor colorWithRed:0 green:0.722 blue:1 alpha:1];
    }
    return self;
}
- (void)stop {
    [waveDisplaylink invalidate];
    waveDisplaylink = nil;
}

#pragma mark - Animation
- (void)start {
    waveBoundaryPath = [UIBezierPath bezierPath];
    
    waveLayer = [CAShapeLayer layer];
    waveLayer.fillColor = _lineColor.CGColor;
    [self.layer addSublayer:waveLayer];
    waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}
- (void)getCurrentWave:(CADisplayLink *)displayLink {
    offsetX += self.waveSpeed;
    waveBoundaryPath = [self getgetCurrentWavePath];
    waveLayer.path = waveBoundaryPath.CGPath;
}

- (UIBezierPath *)getgetCurrentWavePath {
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, lineWaveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  lineWaveWidth ; x++) {
        y = (self.waveAmplitude)* sinf((360/lineWaveWidth) *(x * M_PI / 180) - offsetX * M_PI / 180) + lineWaveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
        
    }
    
    CGPathAddLineToPoint(path, nil, lineWaveWidth, lineWaveHeight+_lineWidth);
    for (float x = lineWaveWidth; x >  0 ; x--) {
        y = (self.waveAmplitude)* sinf((360/lineWaveWidth) *(x * M_PI / 180) - offsetX * M_PI / 180) + lineWaveHeight+_lineWidth;
        CGPathAddLineToPoint(path, nil, x, y);
        
    }
    CGPathAddLineToPoint(path, nil, 0, lineWaveHeight+_lineWidth);
    CGPathCloseSubpath(path);
    
    bezier.CGPath = path;
    CGPathRelease(path);
    return bezier;
}
@end
