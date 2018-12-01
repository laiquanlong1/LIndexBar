//
//  LIndexTableView.h
//  LIndexBar
//
//  Created by HoTia on 2018/11/30.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LIndexTableView;
@protocol  LIndexTableViewDelegate<NSObject>

- (NSMutableArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView;

@end


@interface LIndexTableView : UITableView

@property (nonatomic, weak) id <LIndexTableViewDelegate> indexedDataSource;

@end

NS_ASSUME_NONNULL_END
