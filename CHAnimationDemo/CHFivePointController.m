//
//  CHFivePointController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHFivePointController.h"
#import "CHFivePointView.h"
@implementation CHFivePointController
- (void)viewDidLoad{
    [super viewDidLoad];
    UIView *fivePoint = [[CHFivePointView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150,self.view.frame.size.height/2-150, 300, 300)];
    [self.view addSubview:fivePoint];
}
@end
