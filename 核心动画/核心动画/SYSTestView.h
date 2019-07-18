//
//  SYSTestView.h
//  核心动画
//
//  Created by 孙永帅 on 2016/12/29.
//  Copyright © 2016年 孙永帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYSTestView ;
@protocol SYSTestViewDelegate <NSObject>

-(void)touchTheViewBegin:(SYSTestView *)view;
@end

@interface SYSTestView : UIView

@property(nonatomic,strong) UIImageView *bgImgV;
@property(nonatomic,assign)  CGFloat angle;
@property(nonatomic,weak) id <SYSTestViewDelegate> delegate;
@end
