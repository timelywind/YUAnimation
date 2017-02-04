//
//  YUAnimationViewController.h
//  YUAnimation
//
//  Created by administrator on 17/2/4.
//  Copyright © 2017年 animation.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YUReplicatorAnimation.h"

// layer类型
typedef NS_ENUM(NSUInteger, YULayerType){
    YUCAReplicatorLayer,  // 复制动画
    YUCAEmitterLayer,     // 粒子动画
    YUCAGradientLayer,    // 渐变动画
};

@interface YUAnimationViewController : UITableViewController

@property (nonatomic, assign) YULayerType layerType;

@property (nonatomic, assign) YUReplicatorLayerType replicatorLayerType;

@end
