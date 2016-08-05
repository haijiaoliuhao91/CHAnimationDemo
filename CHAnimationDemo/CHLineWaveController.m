//
//  CHLineWaveController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/8/5.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHLineWave.h"
#import "CHLineWaveController.h"

@implementation CHLineWaveController{
    CHLineWave *_graceLine;
    CHLineWave *_prettyLine;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _graceLine = [[CHLineWave alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2-50, self.view.frame.size.width, 50)];
    _graceLine.waveAmplitude = 13.0f;
    _graceLine.waveSpeed = 9.0f;
    _prettyLine = [[CHLineWave alloc]initWithFrame:_graceLine.frame];
    _prettyLine.waveSpeed = 13.0f;
    _prettyLine.waveAmplitude = 6.0f;
    [self.view addSubview:_graceLine];
    [self.view addSubview:_prettyLine];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_graceLine start];
    [_prettyLine start];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_prettyLine stop];
    [_graceLine stop];
}
@end
