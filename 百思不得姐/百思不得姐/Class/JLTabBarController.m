//
//  JLTabBarController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLTabBarController.h"
#import "JLEssenceViewController.h"
#import "JLNewViewController.h"
#import "JLTrendViewController.h"
#import "JLMeViewController.h"


@interface JLTabBarController ()

@end

@implementation JLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UITabBarItem *item = [UITabBarItem appearance];
    NSDictionary *atts = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:12],
                           NSForegroundColorAttributeName : [UIColor grayColor]
                           };
    NSDictionary *attsSel = @{
                              NSFontAttributeName : [UIFont systemFontOfSize:12],
                              NSForegroundColorAttributeName : [UIColor darkGrayColor]
                              };
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    [item setTitleTextAttributes:attsSel forState:UIControlStateSelected];
    
    self.tabBar.tintColor = [UIColor darkGrayColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildVC:@"JLEssenceViewController" title:@"精华" image:@"tabBar_essence_icon" selImage:@"tabBar_essence_click_icon"];
    [self addChildVC:@"JLNewViewController" title:@"新帖" image:@"tabBar_new_icon" selImage:@"tabBar_new_click_icon"];
    [self addChildVC:@"JLTrendViewController" title:@"关注" image:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon"];
    [self addChildVC:@"JLMeViewController" title:@"我" image:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon"];
}


- (void)addChildVC:(NSString *)vc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    UIViewController *vc1 = [[NSClassFromString(vc) alloc] init];
    vc1.tabBarItem.title = title;
    vc1.tabBarItem.image = [UIImage imageNamed:image];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:selImage];
    
    [self addChildViewController:vc1];
}

@end




















