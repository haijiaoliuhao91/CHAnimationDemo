//
//  CHHistogramView.h
//  CHAnimationDemo
//
//  Created by Chausson on 16/11/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHHistogramView : UIView
@property (nonatomic , strong) NSString *name; //名称
@property (nonatomic , strong) UIColor *textColor;
@property (nonatomic , strong) UIFont *font;
@property (nonatomic , assign) CGFloat lineWidth;
@property (nonatomic , strong) NSArray <UIColor *>*colors; // 颜色
@property (nonatomic , strong) NSArray <NSNumber *>*scales; //比例

- (void)show:(BOOL)animation;

@end
