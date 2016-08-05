//
//  CHLineWave.h
//  CHAnimationDemo
//
//  Created by Chausson on 16/8/5.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHLineWave : UIView
/**
 * @brief speed of wave 扭动的速度
 */
@property (nonatomic,assign)CGFloat waveSpeed;

/**
 * @brief  amplitude of wave 扭动的幅度
 */
@property (nonatomic,assign)CGFloat waveAmplitude;

@property (nonatomic,assign)CGFloat lineWidth;

@property (nonatomic,strong)UIColor *lineColor;
- (void)start;

- (void)stop;

@end
