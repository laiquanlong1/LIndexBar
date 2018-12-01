//
//  LReusePool.h
//  LIndexBar
//
//  Created by HoTia on 2018/11/30.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface LReusePool : NSObject

/**
 从重用池中获取一个视图

 @return 获取的视图
 */
- (UIView *)dequeueReuseableView;

/**
 添加一个重用的视图

 @param view 重用的视图添加到重用池中
 */
- (void)addUsingView:(UIView *)view;


/**
 重置方法，将当前使用中的视图移动到可重用的队列中
 */
- (void)reset;

@end

NS_ASSUME_NONNULL_END
