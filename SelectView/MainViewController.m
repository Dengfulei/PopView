//
//  MainViewController.m
//  SelectView
//
//  Created by 杭州移领 on 16/11/1.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "MainViewController.h"
#import "NavagationTitleView.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NavagationTitleView *titleView = [[NavagationTitleView alloc] initWithFrame:CGRectMake(0, 7, self.view.frame.size.width , 30) withTitles:@[@"商品",@"价格"]];
    [self.navigationController.navigationBar addSubview:titleView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
