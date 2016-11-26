//
//  CHDataViewController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/11/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHDataViewController.h"
#import "CHBrokenLine.h"
#import "CHHistogramView.h"
#import <Masonry/Masonry.h>

@interface CHDataViewController ()
@property (strong , nonatomic) CHBrokenLine *brokenView;
@end

@implementation CHDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self. brokenView = [[CHBrokenLine alloc]init];
    //   self.brokenView.frame = CGRectMake(30, 150, self.view.frame.size.width-225, 200);
    self.brokenView.tintColor = [UIColor orangeColor];
    CHBrokenPoint *point = [CHBrokenPoint brokenPoint:CGPointMake(50, 20)];
    point.name = @"标题1";
    CHBrokenPoint *point2 = [CHBrokenPoint brokenPoint:CGPointMake(120, 50)];
    point2.name = @"标题2";
    CHBrokenPoint *point3 = [CHBrokenPoint brokenPoint:CGPointMake(160, 120)];
    point3.name = @"标题3";
    CHBrokenPoint *point4 = [CHBrokenPoint brokenPoint:CGPointMake(230, 70)];
    
    [self.view addSubview:self.brokenView];
    [self.brokenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.left.right.offset(0);
        make.height.equalTo(@(30));
    }];
    [self.brokenView drew:@[point,point2,point3,point4] animaiton:YES];
    
    CHHistogramView *view = [[CHHistogramView alloc]initWithFrame:CGRectMake(30, 300, 50, 100)];
    view.scales = @[@(0.2),@(0.6)];
    view.backgroundColor = [UIColor whiteColor];
    view.colors = @[[UIColor blueColor],[UIColor greenColor]];
    view.name = @"速度";
    [self.view addSubview:view];
    [view show:YES];
    
    CHHistogramView *view2 = [[CHHistogramView alloc]initWithFrame:CGRectMake(110, 300, 50, 100)];
    view2.scales = @[@(0.8),@(0.4),@(0.8)];
    view2.backgroundColor = [UIColor whiteColor];
    view2.colors = @[[UIColor blueColor],[UIColor greenColor],[UIColor orangeColor]];
    view2.name = @"重力";
    [self.view addSubview:view2];
    [view2 show:YES];
    
    CHHistogramView *view3 = [[CHHistogramView alloc]initWithFrame:CGRectMake(190, 300, 50, 100)];
    view3.scales = @[@(0.5),@(0.4)];
    view3.backgroundColor = [UIColor whiteColor];
    view3.colors = @[[UIColor blueColor],[UIColor greenColor]];
    view3.name = @"体验";
    [self.view addSubview:view3];
    [view3 show:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
