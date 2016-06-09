//
//  JLMeViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLMeViewController.h"

@interface JLMeViewController ()

@end

@implementation JLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
}

- (void)setTitle {
    self.navigationItem.title = @"我的";
    UIButton *moon = [UIButton buttonWithType:UIButtonTypeCustom];
    [moon setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moon setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    moon.bounds = (CGRect){{0, 0}, moon.currentBackgroundImage.size};
    UIBarButtonItem *moonItem = [[UIBarButtonItem alloc] initWithCustomView:moon];
    
    UIButton *settings = [UIButton buttonWithType:UIButtonTypeCustom];
    [settings setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [settings setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    settings.bounds = (CGRect){{0, 0}, moon.currentBackgroundImage.size};
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithCustomView:settings];
    
    self.navigationItem.rightBarButtonItems = @[settingsItem, moonItem];
}
@end





















