//
//  ViewController.m
//  TableMenuDemo
//
//  Created by kangshibiao on 2017/7/28.
//  Copyright © 2017年 ZheJiangTianErRuanJian. All rights reserved.
//

#import "ViewController.h"
#import "SalesManagementVC.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SalesManagementVC * sales = [SalesManagementVC new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:sales];
    
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    app.window.rootViewController = nav;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
