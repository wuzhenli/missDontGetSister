//
//  JLTrendViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//  

#import "JLTrendViewController.h"
#import "JLRecomendViewController.h"

@interface JLTrendViewController ()

@end

@implementation JLTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
}

- (void)setTitle {
    self.navigationItem.title = @"我的关注";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(friendClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    btn.bounds = (CGRect){{0, 0}, btn.currentBackgroundImage.size};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)friendClicked {
    JLRecomendViewController *vc = [[JLRecomendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end




























