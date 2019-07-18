//
//  ViewController.m
//  核心动画
//
//  Created by 孙永帅 on 2016/12/28.
//  Copyright © 2016年 孙永帅. All rights reserved.
//

#import "ViewController.h"
#import "SYSPendulumView.h"
#import "SYSTestView.h"

@interface ViewController ()<SYSTestViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    SYSPendulumView *pendulumView = [[SYSPendulumView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    pendulumView.backgroundColor = [UIColor whiteColor];
    SYSTestView *testView = [[SYSTestView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    testView.delegate = self;
    testView.backgroundColor = [UIColor redColor];
   [ self.view addSubview: testView];
}

-(void)touchTheViewBegin:(SYSTestView *)view{
    // 创建一个基础动画
    CABasicAnimation *animation = [CABasicAnimation new];
    // 设置动画要改变的属性
    animation.keyPath = @"transform.rotation.z";
    //animation.fromValue = @(_bgImgV.layer.transform.m11);
    // 动画的最终属性的值（转7.5圈）
    animation.toValue = @(M_PI*15);
    // 动画的播放时间
    animation.duration = 3;
    // 动画效果慢进慢出
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 解决动画结束后回到原始状态的问题
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    // 将动画添加到视图bgImgV的layer上
    [view.bgImgV.layer addAnimation:animation forKey:@"rotation"];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
  
}


@end
