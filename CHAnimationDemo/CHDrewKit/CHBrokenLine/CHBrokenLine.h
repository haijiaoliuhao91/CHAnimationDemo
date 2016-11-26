//
//  CHBrokenLine.h
//  CHAnimationDemo
//
//  Created by Chausson on 16/11/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHBrokenPoint:NSObject
@property (nonatomic , strong) NSString *name; //图标折线点的名称
@property (nonatomic , assign) CGPoint point;  //图标折线的位置
@property (nonatomic , strong) UIColor *tintColor; // 主要线的颜色,默认为黑色
@property (nonatomic , strong) UIColor *subColor; // 标题名称的颜色,默认为黑色
@property (nonatomic , assign) CGFloat lineWidth; // 线的宽度,默认为2
@property (nonatomic , strong) UIFont *font; //标题的字体没有使用,默认的是13

+ (CHBrokenPoint *)brokenPoint:(CGPoint )aPoint;
@end
@interface CHBrokenLine : UIView
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points;
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points
             animaiton:(BOOL)open;
- (CHBrokenLine *)drew:(NSArray <CHBrokenPoint *>*)points
             animaiton:(BOOL)open
              duration:(NSTimeInterval )time;
- (CHBrokenLine *)clear;

@end
