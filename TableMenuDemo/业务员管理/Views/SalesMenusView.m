//
//  SalesMenusView.m
//  GenSilverTesco
//
//  Created by kangshibiao on 2017/7/27.
//  Copyright © 2017年 ZheJiangTianErRuanJian. All rights reserved.
//

#import "SalesMenusView.h"
@implementation SalesMenusView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setViewCornerRadiusViews:@[self.myTableView] floatCoriner:3];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self baseXIB_removeSubView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

static NSString *cellId = @"";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = @"菜单";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.base_BlockIdx) {
        self.base_BlockIdx(indexPath.row);
    }
    [self baseXIB_removeSubView];
}

#pragma mark -- TableView 分割线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)showViewDirection:(Direction)direction rect:(CGRect)rect{
    self.myTableView.tableHeaderView = [UIView new];

    if (direction == direction_top) {
        self.topview_layout_top.constant = (rect.origin.y  +30);
        self.topView_layout_leading.constant = rect.origin.x + 20;
        self.bottomView.hidden = YES;
        
    }else{
        self.table_topView_layout_bottom.priority = 690;
        self.table_topView_layout_traling.priority =  690;
        self.table_bottomView_layout_bottom.priority = 750;
        self.table_bottomView_layout_traling.priority = 750;
        self.bottomView_layout_top.constant = [UIScreen mainScreen].bounds.size.height -  rect.origin.y -20;
        self.bottomView_layout_leading.constant = rect.origin.x + 20;
        self.topView.hidden = YES;
    }
    self.table_layout_width.constant = 0;
    self.table_layout_height.constant = 0;
    
    [self baseXIB_showAlpha:.2 color:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.table_layout_width.constant = 100;
        self.table_layout_height.constant = 132;
        [UIView animateWithDuration:.3 animations:^{
            [self layoutIfNeeded];
            
        }];
    });

}

@end
