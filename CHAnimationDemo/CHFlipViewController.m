//
//  CHFlipViewController.m
//  CHAnimationDemo
//
//  Created by Chausson on 2017/1/6.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "CHFlipViewController.h"

@interface CHFlipViewController ()

@end

@implementation CHFlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.flipBtn = [[CHFlipButton alloc]initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-50, 100, 100)];
    [self.flipBtn setImage:[UIImage imageNamed:@"buyfull"]];
    [self.flipBtn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.flipBtn];
}
- (void)action{
    if (self.flipBtn.isAnimation) {
        [self.flipBtn stop];
        return;
    }
    [self.flipBtn start];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
