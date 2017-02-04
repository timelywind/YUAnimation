//
//  YULoadingLabel.h
//
//  Created by administrator on 17/1/20.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YULoadingLabel : UILabel

// 创建Label
+ (YULoadingLabel *)loadingLabel;

// 显示加载动画
- (void)showLoadingInView:(UIView *)view text:(NSString *)text;

// 隐藏
- (void)hide;

@end
