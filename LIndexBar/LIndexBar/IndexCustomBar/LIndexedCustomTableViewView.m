//
//  LIndexedCustomTableViewView.m
//  LIndexBar
//
//  Created by HoTia on 2018/12/1.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "LIndexedCustomTableViewView.h"
#import "LcustomReusePool.h"

@interface LIndexedCustomTableViewView ()
{
    UIView *_constainer;
    LcustomReusePool *_reuseablePool;
    NSMutableSet *_userQueue;
}
@end

@implementation LIndexedCustomTableViewView

- (void)reloadData {
    [super reloadData];
    
    if (_userQueue == nil) {
        _userQueue = [NSMutableSet set];
    }
    
    if (_constainer == nil) {
        _constainer = [[UIView alloc] initWithFrame:CGRectZero];
        [self.superview insertSubview:_constainer aboveSubview:self];
    }
    [_constainer setHidden:YES];
    
    if (_reuseablePool == nil) {
        _reuseablePool = [LcustomReusePool new];
    }
    
    UIView *view = [_userQueue anyObject];
    while (view) {
        [_userQueue removeObject:view];
        [_reuseablePool adddequeUseableView:view];
        view = [_userQueue anyObject];
        [view removeFromSuperview];
    }
    
    [self reloadDataWithIndexed];
}

- (void)reloadDataWithIndexed {
    NSArray *titlesArray = nil;
    if ([self.indexedCustomDataSource respondsToSelector:@selector(indexedCustomTableView:)]) {
       titlesArray = [self.indexedCustomDataSource indexedCustomTableView:self];
    }
    if (titlesArray.count <= 0) {
        [_constainer setHidden:YES];
        return;
    }
    
    CGFloat btn_width = 70;
    CGFloat btn_height = self.frame.size.height/titlesArray.count;
    
    
    for (int i = 0 ; i < titlesArray.count; i++) {
        NSString *title = [titlesArray objectAtIndex:i];
        UIButton *view = (UIButton *)[_reuseablePool dequeueUseableView];
        if (view == nil) {
            view = [[UIButton alloc] initWithFrame:CGRectZero];
            NSLog(@"创建了一个新 button");
        }else {
            NSLog(@"重用了一个 button");
        }
        [_userQueue addObject:view];
        
        view.frame = CGRectMake(0, btn_height*i, btn_width, btn_height);
        [view setTitle:title forState:UIControlStateNormal];
        [view setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        [_constainer addSubview:view];
    }
    _constainer.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - btn_width, 0, btn_width, self.frame.size.height);
    [_constainer setHidden:NO];
    
}

@end
