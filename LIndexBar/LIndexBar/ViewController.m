//
//  ViewController.m
//  LIndexBar
//
//  Created by HoTia on 2018/11/30.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
//#import "LindexTableView.h"
#import "LindexedCustomTableViewView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, LIndexedCustomTableViewViewDataSource>
{
    LIndexedCustomTableViewView *tableView; // 带有索引条的tableView
    
    UIButton *button;
    NSMutableArray *dataSource;
}
@end

@implementation ViewController
- (IBAction)doAction:(id)sender {
    NSLog(@"重新刷新");
    [tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建tableView
    tableView = [[LIndexedCustomTableViewView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.indexedCustomDataSource = self;
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 60)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"reloadTable" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 100; i ++) {
        [dataSource addObject:@(i+1)];
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark LIndexTableViewDelegate

- (NSMutableArray<NSString *> *)indexedCustomTableView:(UITableView *)tableView {
    static BOOL eable = YES;
    if (eable) {
        eable = NO;
        return [@[@"A",@"B",@"C"]mutableCopy];
    }else {
        eable = YES;
        return [@[@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"]mutableCopy];
    }
}




#pragma mark UITableViewDataSource


/**
 返回区数
 
 @param tableView 列表视图
 @return 返回区数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


/**
 返回每个区的行
 
 @param tableView 列表视图
 @param section 区
 @return 返回行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSource count];
}


/**
 配置cell
 
 @param tableView 列表视图
 @param indexPath 布局对象
 @return 返回一个cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


@end
