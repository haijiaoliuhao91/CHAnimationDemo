//
//  CHRadarController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHRadarController.h"

@implementation CHRadarController
- (void)viewDidLoad{
    [super viewDidLoad];
    CHRadar *radar = [[CHRadar alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40,self.view.frame.size.height/2-40, 80, 80)];
    radar.delegate =self;
    radar.image = [UIImage imageNamed:@"xiu"];
    radar.radarColor = [UIColor colorWithRed:5/255.0f green:154/255.0f blue:239/255.0f alpha:1];
    [self.view addSubview:radar];
}
- (void)ch_radarDidStoped{
    NSLog(@"结束动画");
}
- (void)ch_radarWillStart{
    NSLog(@"开始动画");
}
@end
