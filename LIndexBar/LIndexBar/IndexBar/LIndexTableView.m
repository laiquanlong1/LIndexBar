//
//  LIndexTableView.m
//  LIndexBar
//
//  Created by HoTia on 2018/11/30.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "LIndexTableView.h"
#import "LReusePool.h"

@interface LIndexTableView ()
{
    UIView *containerView;
    LReusePool *reusePool;
    
}

@end

@implementation LIndexTableView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)reloadData {
    [super reloadData];
    
    if (containerView == nil) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
    }
    [self.superview insertSubview:containerView aboveSubview:self];
    
    if (reusePool == nil) {
        reusePool = [[LReusePool alloc] init];
    }
    
    [reusePool reset];
    
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar {
    NSArray <NSString *>* arrTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrTitles =  [[self.indexedDataSource indexTitlesForIndexTableView:self] copy];
    }
    
    // 判断字母索引条是否为空
    if (!arrTitles || arrTitles.count <= 0) {
        [containerView setHidden:YES];
        return;
    }
    
    NSUInteger count = arrTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    for (int i = 0; i < [arrTitles count]; i ++) {
        NSString *title = [arrTitles objectAtIndex:i];
        UIButton *button = (UIButton *)[reusePool dequeueReuseableView];
        if (button == nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            [reusePool addUsingView:button];
            NSLog(@"创建一个Button");
        }else {
            NSLog(@"重用一个Button");
        }
        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, i*buttonHeight, buttonWidth, buttonHeight)];
    }
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x+self.frame.size.width-buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}


@end
