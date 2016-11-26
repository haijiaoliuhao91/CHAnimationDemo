//
//  ViewController.m
//  CHAnimationDemo
//
//  Created by Chausson on 16/4/6.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong ,nonatomic) NSArray <NSString *>*data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@"FivePointStartDemo",@"Radar Demo",@"Pie Demo",@"Circle HUD",@"Heart Demo",@"CHLineWave",@"CHData"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *title =[cell viewWithTag:10];
    title.text = self.data[indexPath.row];
    return cell;
    
}
#define PushController(name)  [self.navigationController pushViewController:[[NSClassFromString(name) alloc]init] animated:YES];
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        
        [self performSegueWithIdentifier:@"FivePoint" sender:self];
        
    }else if(indexPath.row == 1){
        
        [self performSegueWithIdentifier:@"Radar" sender:self];
    }else if(indexPath.row == 2){
        
        [self performSegueWithIdentifier:@"Pie" sender:self];
    }else if(indexPath.row == 3){
        
        [self performSegueWithIdentifier:@"Circle" sender:self];
    }else if(indexPath.row == 4){
        
        [self performSegueWithIdentifier:@"Heart" sender:self];
    }else if(indexPath.row == 5){
        PushController(@"CHLineWaveController");
    }else if(indexPath.row == 6){
        PushController(@"CHDataViewController");
    }

}
@end
