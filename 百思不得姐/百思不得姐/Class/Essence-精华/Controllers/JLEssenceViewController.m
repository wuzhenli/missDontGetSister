//
//  JLEssenceViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLEssenceViewController.h"
#import <SVProgressHUD.h>

@interface JLEssenceViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *indicatorBar;

@end

@implementation JLEssenceViewController

- (instancetype)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    NSString *className = NSStringFromClass([self class]);
    if (self = [super initWithNibName:className bundle:nibBundle]) {
        ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle];
    
    [self setup];
}

- (void)setup {
    CGRect rect = [UIScreen mainScreen].bounds;
    NSLog(@"%@",NSStringFromCGRect(rect));
    rect = self.view.frame;
    
    NSLog(@"%@",NSStringFromCGRect(rect));
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












