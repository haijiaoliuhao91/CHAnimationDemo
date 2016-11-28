//
//  DrewPieView.h
//  DrewPieDemo
//
//  Created by Chausson on 16/3/16.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHDrewPieView : UIView

/**
 *   @brief 根据参数绘制饼状图
 *   @param scales 传入的比例参数集合,如:15% = 0.15 ["0.15","0.55","0.3"]
 *   @param colors 传入的每次饼图的颜色
 */
- (instancetype)initWithFrame:(CGRect)frame
                       scales:(NSArray <NSNumber *>*)scales
                       colors:(NSArray <UIColor *>*)colors;
- (instancetype)initWithFrame:(CGRect)frame __unavailable;
- (instancetype)init __unavailable;
- (void)show:(BOOL)animation;
@end
