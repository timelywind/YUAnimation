//
//  YUMainTableViewController.m
//  YUAnimation
//
//  Created by administrator on 17/2/3.
//  Copyright © 2017年 animation.com. All rights reserved.
//

#import "YUMainTableViewController.h"
#import "YUAnimationViewController.h"

@interface YUMainTableViewController ()
{
    // 各种layer动画
    NSArray *_layerTypes;
}

@end

@implementation YUMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"三种特殊的layer动画";
    _layerTypes = @[@"CAReplicatorLayer 复制层动画", @"CAEmitterLayer 粒子动画", @"CAGradientLayer 渐变动画"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layerTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _layerTypes[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YUAnimationViewController *animationCtrl = [[YUAnimationViewController alloc] init];
    animationCtrl.layerType = indexPath.row;
    animationCtrl.title = _layerTypes[indexPath.row];
    [self.navigationController pushViewController:animationCtrl animated:YES];
}

@end
