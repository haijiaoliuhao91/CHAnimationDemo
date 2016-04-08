//
//  CHCircleViewController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/8.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHCircleViewController.h"
#import "CHCircleHUD.h"
@implementation CHCircleViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    CHCircleHUD *circle = [[CHCircleHUD alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50, 100, 100)];
    [self.view addSubview:circle];
}
@end
