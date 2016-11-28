//
//  CHPieController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHPieController.h"
#import "CHDrewPieView.h"
@implementation CHPieController
- (void)viewDidLoad{
    [super viewDidLoad];

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CHDrewPieView *pie = [[CHDrewPieView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150,self.view.frame.size.height/2-150, 300, 300) scales:@[@(0.15),@(0.16),@(0.34),@(0.35)] colors:@[[UIColor brownColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor redColor]]];
    [self.view addSubview:pie];
    [pie show:YES];
}
@end
