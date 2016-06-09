//
//  JLNavgationController.m
//  百思不得姐
//
//  Created by kfz on 16/6/9.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLNavgationController.h"

@interface JLNavgationController ()

@end

@implementation JLNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ( self.childViewControllers.count > 0 ) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = (CGRect){{0, 0}, {100, 40}};
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitle:@"返回" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:viewController action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end











