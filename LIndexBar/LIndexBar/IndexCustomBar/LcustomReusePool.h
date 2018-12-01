//
//  LcustomReusePool.h
//  LIndexBar
//
//  Created by HoTia on 2018/12/1.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LcustomReusePool : UITableView

/**
 从重用池中获取一个可用视图

 @return 可用视图
 */
- (UIView *)dequeueUseableView;


/**
 添加视图到重用队列

 @param view 将要放入重用队列的视图
 */
- (void)adddequeUseableView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END
