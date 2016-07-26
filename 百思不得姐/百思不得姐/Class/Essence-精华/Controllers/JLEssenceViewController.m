//
//  JLEssenceViewController.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLEssenceViewController.h"
#import <SVProgressHUD.h>
#define IndicatorBarWidth 15
#define IndicatorBarHeight 3


@interface JLEssenceViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) UIView *indicatorBar;

/** titleView的高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewHeight;

@end

@implementation JLEssenceViewController

- (UIView *)indicatorBar {
    if (!_indicatorBar) {
        UIView *bar = [[UIView alloc] init];
        bar.frame = CGRectMake(0, 0, 100, 2);
        bar.backgroundColor = [UIColor redColor];
        [self.titleView addSubview:bar];
        _indicatorBar = bar;
    }
    return _indicatorBar;
}

- (instancetype)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    NSString *className = NSStringFromClass([self class]);
    if (self = [super initWithNibName:className bundle:nibBundle]) {
        ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {  // @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setNavBar];
    [self addTitleButtons];
    [self addContentView];
    [self addContentView];
}

- (void)setNavBar {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *item = [[UIButton alloc] init];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [item setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    item.bounds = (CGRect){{0, 0}, item.currentBackgroundImage.size};
    [item addTarget:self action:@selector(leftBarClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:item];
}

- (void)addContentView {
    NSUInteger count = self.titleView.subviews.count - 1;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = SC_Width;
    NSLog(@"%f",SC_Width);
    CGFloat height = SC_Height;
    for (NSUInteger i = 0; i< count; i++) {
        x = width * i;
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = RandomColor;
        [self addChildViewController:vc];
        
        vc.view.frame = (CGRect){{x, y}, {width, height}};
        [self.contentView addSubview:vc.view];
    }
    self.contentView.contentSize = (CGSize) {width * count, height};
    self.contentView.pagingEnabled = YES;
    self.contentView.showsVerticalScrollIndicator = NO;
    self.contentView.showsHorizontalScrollIndicator = NO;
}

- (void)addTitleButtons {
    NSArray *titleArray = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger titleCount = titleArray.count;
    
    CGFloat width = SC_Width / titleCount;
    CGFloat height = self.titleViewHeight.constant - IndicatorBarHeight;
    CGFloat x = 0, y = 0;
    
    for (NSUInteger i=0; i<titleCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.backgroundColor = RandomColor;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        x = width * i;
        btn.frame = (CGRect){{x, y}, {width, height}};
        [self.titleView addSubview:btn];
        if (i == 0) {
            // 让按钮内部的label根据内容计算尺寸
            [btn.titleLabel sizeToFit];
            self.indicatorBar.width = btn.titleLabel.width;
            self.indicatorBar.center = btn.center;
            self.indicatorBar.y = height;
            self.indicatorBar.centerX = btn.centerX;
        }
    }
    self.indicatorBar.tag = titleCount;
}

- (void)leftBarClicked {
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end


















