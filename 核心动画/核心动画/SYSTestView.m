//
//  SYSTestView.m
//  核心动画
//
//  Created by 孙永帅 on 2016/12/29.
//  Copyright © 2016年 孙永帅. All rights reserved.
//

#import "SYSTestView.h"

@implementation SYSTestView

{
   
   
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    //NSArray *arr = @[@"10",@"20",@"40",@"50",@"60",@"80",@"100",@"140",@"200",@"300",@"400",@"500",@"1000",@"2000",@"10000"];
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    // 背景图片
    UIImageView *bgImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    bgImgV.layer.cornerRadius = bgImgV.frame.size.width/2;
    bgImgV.layer.masksToBounds = YES;
    bgImgV.center = self.center;
    bgImgV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self addSubview:bgImgV];
    _bgImgV = bgImgV;
    
    //
    NSInteger i = 0;
    // 圆的半径
    CGFloat r = bgImgV.frame.size.width/2;
    // 转盘每一扇形的角度
    CGFloat angle = M_PI/180 * 360/arr.count;
    _angle = angle;
    // 循环创建扇形上的数字
    for (NSString *str in arr) {
        
        UILabel *rewardMoneyLabel = [UILabel new];
        rewardMoneyLabel.frame = CGRectMake(r, 0, cos(angle/2) * r,2 * sin(angle/2) * r);
        rewardMoneyLabel.center = CGPointMake(rewardMoneyLabel.center.x,bgImgV.frame.size.height/2);
        rewardMoneyLabel.textAlignment = NSTextAlignmentRight;
        //rewardMoneyLabel.backgroundColor = [UIColor greenColor];
        rewardMoneyLabel.text = str;
        [bgImgV addSubview:rewardMoneyLabel];
        
        // 设置锚点（以视图上的哪一点为旋转中心，（0，0）是左下角，（1，1）是右上角，（0.5，0.5）是中心）
        rewardMoneyLabel.layer.anchorPoint = CGPointMake(0, 0.5);
        // 设置旋转的位置
        rewardMoneyLabel.layer.position = CGPointMake(r, r);
        // 旋转
        rewardMoneyLabel.transform = CGAffineTransformMakeRotation(angle * i);
        i ++ ;
    }
    
    //红色开始按钮
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(0, 0, 50, 50);
    startBtn.center = CGPointMake(r, r);
    startBtn.backgroundColor = [UIColor redColor];
    // 开始按钮点击事件
    [startBtn addTarget:self action:@selector(startBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startBtn];
}
// 点击红色开始按钮事件
- (void)startBtnAction{
//    // 创建一个基础动画
//    CABasicAnimation *animation = [CABasicAnimation new];
//    // 设置动画要改变的属性
//    animation.keyPath = @"transform.rotation.z";
//    //animation.fromValue = @(_bgImgV.layer.transform.m11);
//    // 动画的最终属性的值（转7.5圈）
//    animation.toValue = @(M_PI*15);
//    // 动画的播放时间
//    animation.duration = 3;
//    // 动画效果慢进慢出
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    // 解决动画结束后回到原始状态的问题
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    // 将动画添加到视图bgImgV的layer上
//    [_bgImgV.layer addAnimation:animation forKey:@"rotation"];
    
    
    // 其他两种旋转方法
    //    [UIView animateWithDuration:1 animations:^{
    ////        _bgImgV.transform = CGAffineTransformRotate(_bgImgV.transform, M_PI/180 + _angle);
    //    }];
    //    [UIView animateWithDuration:1 animations:^{
    //        _bgImgV.layer.transform = CATransform3DRotate(_bgImgV.layer.transform, _angle, 0, 0, 1);
    //    }];
    if ([self.delegate respondsToSelector:@selector(touchTheViewBegin:)]) {
        [self.delegate touchTheViewBegin:self];
    }
}

@end


