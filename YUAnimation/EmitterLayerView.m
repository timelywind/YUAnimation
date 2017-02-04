

#import "EmitterLayerView.h"

@interface EmitterLayerView () {
    
    CAEmitterLayer *_layer;
}

@end

@implementation EmitterLayerView

/**
 *  替换layer
 *
 *  @return 替换当前view的layer
 */
+ (Class)layerClass {
    
    return [CAEmitterLayer class];
}

/**
 *  模拟setter，getter方法
 *
 */
- (void)setEmitterLayer:(CAEmitterLayer *)layer {
    
    _layer = layer;
}

- (CAEmitterLayer *)emitterLayer {
    
    return _layer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _layer = (CAEmitterLayer *)self.layer;
    }
    return self;
}

- (void)show {

}

- (void)hide {
    
}

- (void)configType:(EMitterType)type {

}

@end
