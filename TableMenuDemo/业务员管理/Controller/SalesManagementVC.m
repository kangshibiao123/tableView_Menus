//
//  SalesManagementVC.m
//  GenSilverTesco
//
//  Created by kangshibiao on 2017/7/27.
//  Copyright © 2017年 ZheJiangTianErRuanJian. All rights reserved.
//

#define Screen_wide    [UIScreen mainScreen].bounds.size.width
#define Screen_heigth  [UIScreen mainScreen].bounds.size.height

#import "SalesManagementVC.h"
#import "SalesManagementCell.h"
#import "SalesMenusView.h"
#import "KSBaseXIBView.h"
@interface SalesManagementVC ()

@end

@implementation SalesManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.myTableView registerNib:[UINib nibWithNibName:@"SalesManagementCell" bundle:nil] forCellReuseIdentifier:@"SalesManagementCell"];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SalesManagementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SalesManagementCell" forIndexPath:indexPath];
    
    [cell.moreAndMore addTarget:self action:@selector(moreAndMoreClick:) forControlEvents:UIControlEventTouchUpInside];
    return  cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (void)moreAndMoreClick:(UIButton *)sender{
    
    /**
     *  精力有限。 工作太忙  剩下的 自己根据需求扩展    如有问题 小弟 qq 978202378
     */
    SalesManagementCell *cell = (SalesManagementCell *)sender.superview.superview.superview;
    
    CGRect rect = [cell.moreBgView convertRect:sender.frame toView:self.view];
    
    SalesMenusView * menusView = [SalesMenusView initBaseView];
    menusView.base_BlockIdx = ^(NSInteger index){
        
        NSLog(@"---%d",index);
    };
    NSInteger isFlig = 0;
    
    if ((Screen_heigth - rect.origin.y - 132 - 64) <= 40) {
        isFlig = direction_bottom;
    }else{
        isFlig = direction_top;
    }
    [menusView showViewDirection:isFlig rect:rect];
  
  
}


@end
