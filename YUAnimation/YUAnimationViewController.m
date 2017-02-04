//
//  YUAnimationViewController.m
//  YUAnimation
//
//  Created by administrator on 17/2/4.
//  Copyright © 2017年 animation.com. All rights reserved.
//

#import "YUAnimationViewController.h"
#import "YULoadingLabel.h"
#import "SnowView.h"

@interface YUAnimationViewController ()
{
    // 各种CAReplicatorLayer的动画
    NSArray *_animationTypes;
}

@property (nonatomic, strong) SnowView *snow;

@end

@implementation YUAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

// 三种layer的动画
- (void)setLayerType:(YULayerType)layerType
{
    
    switch (layerType) {
        case YUCAReplicatorLayer:
        {
            [self setupCAReplicatorLayerAnimation];
        }
            break;
        case YUCAEmitterLayer:
        {
            [self setupCAEmitterLayer];
            self.view.backgroundColor = [UIColor grayColor];
        }
            break;
        case YUCAGradientLayer:
        {
            [self setupCAGradientLayer];
            self.view.backgroundColor = [UIColor grayColor];
        }
            break;
        default:
            break;
    }
}

#pragma mark -----------------------  各种CAReplicatorLayer的动画

- (void)setReplicatorLayerType:(YUReplicatorLayerType)replicatorLayerType
{
    CGFloat width = 100;
    CGRect viewframe = CGRectMake((kScreenWidth - width) / 2, 150, width, width);
    
    switch (replicatorLayerType) {
            
        case YUReplicatorLayerShake:
            viewframe = CGRectMake(80, 200, width, width);
            break;
            
        case YUReplicatorLayerHeart:
            viewframe = CGRectMake(0, 64, width, width);
            break;
        default:
            break;
    }
    
    UIView *aniView = [[UIView alloc] initWithFrame:viewframe];
    [self.view addSubview:aniView];
    [aniView.layer addSublayer: [YUReplicatorAnimation replicatorLayerWithType:replicatorLayerType]];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)setupCAReplicatorLayerAnimation
{
    _animationTypes = @[@"波纹 animation", @"波浪 animation", @"三角形 animation", @"网格 animation", @"条形 animation", @"转圈 animation", @"心 animation", @"翻转 animation"];
}

#pragma mark -----------------------  CAEmitterLayer 粒子动画

- (void)setupCAEmitterLayer
{
    self.snow = [[SnowView alloc] initWithFrame:CGRectMake(100, 100, kScreenWidth / 2.f, kScreenWidth / 2.f)];
    //    self.snow.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.snow];
    self.snow.snowImage  = [UIImage imageNamed:@"snow"];
    self.snow.birthRate  = 20.f;
    self.snow.gravity    = 5.f;
    self.snow.snowColor  = [UIColor whiteColor];
    
    CALayer *layer    = [CALayer layer];
    layer.anchorPoint = CGPointMake(0, 0);                          // 重置锚点
    layer.bounds      = CGRectMake(0, 0, kScreenWidth / 2.f, kScreenWidth / 2.f);  // 设置尺寸
    UIImage *image = [UIImage imageNamed:@"alpha"];
    if (image) {
        layer.contents = (__bridge id)(image.CGImage);
    }
    
    self.snow.layer.mask = layer;
    [self.snow showSnow];
}

#pragma mark -----------------------  渐变动画

- (void)setupCAGradientLayer
{
    // CAGradientLayer 动画
    YULoadingLabel *loadingLabel = [YULoadingLabel loadingLabel];
    loadingLabel.frame = CGRectMake(100, 100, 200, 100);
    [loadingLabel showLoadingInView:self.view text:nil];
    
    YULoadingLabel *loadingLabel2 = [YULoadingLabel loadingLabel];
    loadingLabel.textColor = [UIColor redColor];
    loadingLabel2.frame = CGRectMake(110, 200, 200, 100);
    [loadingLabel2 showLoadingInView:self.view text:@"加载动画"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _animationTypes[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YUAnimationViewController *animationCtrl = [[YUAnimationViewController alloc] init];
    animationCtrl.replicatorLayerType = indexPath.row;
    animationCtrl.title = _animationTypes[indexPath.row];
    [self.navigationController pushViewController:animationCtrl animated:YES];
}

@end
