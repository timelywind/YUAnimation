//
//  YUReplicatorAnimation.h
//  YUAnimation
//
//  Created by administrator on 17/2/4.
//  Copyright © 2017年 animation.com. All rights reserved.
//

#import <UIKit/UIKit.h>

// 动画类型
typedef NS_ENUM(NSUInteger, YUReplicatorLayerType){
    YUReplicatorLayerCircle,
    YUReplicatorLayerWave,
    YUReplicatorLayerTriangle,
    YUReplicatorLayerGrid,
    YUReplicatorLayerShake,
    YUReplicatorLayerRound,
    YUReplicatorLayerHeart,
    YUReplicatorLayerTurn,
};

@interface YUReplicatorAnimation : NSObject

+ (CALayer *)replicatorLayerWithType:(YUReplicatorLayerType)type;

// 波纹
+ (CALayer *)replicatorLayer_Circle;

// 波浪
+ (CALayer *)replicatorLayer_Wave;

// 三角形
+ (CALayer *)replicatorLayer_Triangle;

// 网格
+ (CALayer *)replicatorLayer_Grid;

// 震东条
+ (CALayer *)replicatorLayer_Shake;

// 转圈动画
+ (CALayer *)replicatorLayer_Round;

// 心动画
+ (CALayer *)replicatorLayer_Heart;

@end
