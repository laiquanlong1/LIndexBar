//
//  LReusePool.m
//  LIndexBar
//
//  Created by HoTia on 2018/11/30.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "LReusePool.h"

@interface LReusePool ()

/**
 等待使用的队列
 */
@property (nonatomic, strong) NSMutableSet <UIView *>*waitUsedQueue;

/**
 使用中的队列
 */
@property (nonatomic, strong) NSMutableSet <UIView *>*usingQueue;
@end

@implementation LReusePool


- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReuseableView {
    UIView *view = [_waitUsedQueue anyObject];
    if (view == nil) {
        return nil;
    }else {
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
    }
    return view;
}

- (void)addUsingView:(UIView *)view {
    if (view == nil) {
        return;
    }
    [_usingQueue addObject:view];
}

- ( void)reset {
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        [_usingQueue removeObject:view];
        [_waitUsedQueue addObject:view];
    }
}

@end
