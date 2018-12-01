//
//  LcustomReusePool.m
//  LIndexBar
//
//  Created by HoTia on 2018/12/1.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "LcustomReusePool.h"

@interface LcustomReusePool ()
@property (nonatomic, strong) NSMutableSet *reuseSets;
@end

@implementation LcustomReusePool

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reuseSets = [NSMutableSet set];
    }
    return self;
}

/**
 从重用池中获取一个可用视图
 
 @return 可用视图
 */
- (UIView *)dequeueUseableView {
    UIView *view = [self.reuseSets anyObject];
    if (view) {
        [self.reuseSets removeObject:view];
        return view;
    }
    return nil;
}
/**
 添加视图到重用队列
 
 @param view 将要放入重用队列的视图
 */
- (void)adddequeUseableView:(UIView *)view {
    if (view == nil) {
        return;
    }
    [self.reuseSets addObject:view];
}

@end
