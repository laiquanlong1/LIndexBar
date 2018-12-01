//
//  LIndexedCustomTableViewView.h
//  LIndexBar
//
//  Created by HoTia on 2018/12/1.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LIndexedCustomTableViewView;
@protocol  LIndexedCustomTableViewViewDataSource <NSObject>
// 获取索引数据源
- (NSArray <NSString *> *)indexedCustomTableView:(LIndexedCustomTableViewView *)tableView;

@end
@interface LIndexedCustomTableViewView : UITableView
/**
 数据源
 */
@property (nonatomic, weak) id <LIndexedCustomTableViewViewDataSource> indexedCustomDataSource;
@end

NS_ASSUME_NONNULL_END
