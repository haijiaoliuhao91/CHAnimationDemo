//
//  CHHeartViewController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/7/9.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHHeartViewController.h"
#import "CHHeartView.h"
#import <pop/POP.h>
@implementation CHHeartViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    CHHeartView *heart = [[CHHeartView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40,self.view.frame.size.height/2-40, 80, 80)];
    heart.tag = 100;
    [heart setImage:[UIImage imageNamed:@"buyfull"]];
    [self.view addSubview:heart];
    [heart startAnimation];
    

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
  //  [[self.view viewWithTag:100] stopAnimation];
}

@end
