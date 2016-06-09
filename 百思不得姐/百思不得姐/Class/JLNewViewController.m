//
//  JLNewViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLNewViewController.h"

@interface JLNewViewController ()

@end

@implementation JLNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
}

- (void)setTitle {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    item.bounds = (CGRect){{0, 0}, item.currentBackgroundImage.size};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:item];
}

@end




















