//
//  JLEssenceViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLEssenceViewController.h"

@interface JLEssenceViewController ()

@end

@implementation JLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
}

- (void)setTitle {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *item = [[UIButton alloc] init];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    item.bounds = (CGRect){{0, 0}, item.currentBackgroundImage.size};
    [item addTarget:self action:@selector(leftBarClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:item];
}

- (void)leftBarClicked {
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end












