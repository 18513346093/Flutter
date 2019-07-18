//
//  SYSPendulumView.m
//  CloudsOutpatient
//
//  Created by 孙永帅 on 2016/12/29.
//  Copyright © 2016年 HC. All rights reserved.
//

#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

#import "SYSPendulumView.h"

@interface SYSPendulumView  ()
@property(nonatomic ,strong)UIImageView *pendulumImageView;
@property(nonatomic, strong)UIButton *pendulumBtn;
@property(nonatomic, strong)UIView *testView;


@end

@implementation SYSPendulumView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self addSubview:self.testView];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return  self;
}

-(UIImageView *)pendulumImageView{
    
    if (!_pendulumImageView ) {
        _pendulumImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 100, 100)];
        
        _pendulumImageView.layer.anchorPoint = CGPointMake(0.5, 0);
//        _pendulumImageView.backgroundColor =[UIColor redColor];
        _pendulumImageView.image = [UIImage imageNamed:@"sign_white_YES"];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath = @"transform.rotation";
        
        anim.values = @[@(Angle2Radian(-5)),  @(Angle2Radian(5)), @(Angle2Radian(-5))];
        anim.duration = 0.8;
        // 动画的重复执行次数
        anim.repeatCount = MAXFLOAT;
        
        // 保持动画执行完毕后的状态
        anim.removedOnCompletion = NO;
        anim.fillMode = kCAFillModeForwards;
        

         [_pendulumImageView.layer addAnimation:anim forKey:@"shake"];
        
    }
    return _pendulumImageView;
}

-(UIButton *)pendulumBtn{
    if (!_pendulumBtn) {
        _pendulumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _pendulumBtn.backgroundColor = [UIColor redColor];
        _pendulumBtn.frame = CGRectMake(50, 100, 30, 30);
        [_pendulumBtn setImage: [UIImage imageNamed:@"sign_white_YES"] forState:UIControlStateNormal];
        _pendulumBtn.layer.anchorPoint = CGPointMake(0.5, 0);
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath = @"transform.rotation";
        
        anim.values = @[@(Angle2Radian(-5)),  @(Angle2Radian(5)), @(Angle2Radian(-5))];
        anim.duration = 0.8;
        // 动画的重复执行次数
        anim.repeatCount = MAXFLOAT;
        
        // 保持动画执行完毕后的状态
        anim.removedOnCompletion = NO;
        anim.fillMode = kCAFillModeForwards;
        [_pendulumBtn.layer addAnimation:anim forKey:nil];
    }
    
    return _pendulumBtn;
}

-(UIView *)testView{
    if (!_testView) {
        _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _testView.backgroundColor = [UIColor redColor];
        CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
        anima.keyPath =@"position" ;
        
        anima.removedOnCompletion =NO;
        anima.fillMode = kCAFillModeForwards;
        anima.duration = 2.0;
        anima.repeatCount = MAXFLOAT;
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
        anima.path = path;
        CGPathRelease(path);
        [_testView.layer addAnimation:anima forKey:nil];
        
    }
    return _testView;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ref, CGRectMake(0, 0, rect.size.width, rect.size.height));
    CGContextSetLineWidth(ref, 2.0);
    [[UIColor redColor] set];
    CGContextStrokePath(ref);
}


@end
