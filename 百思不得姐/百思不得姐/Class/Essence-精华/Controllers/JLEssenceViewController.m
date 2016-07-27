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


@interface JLEssenceViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) UIView *indicatorBar;

/** titleView的高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewHeight;

@property (strong, nonatomic) UIButton *selectedBtn;

@end

@implementation JLEssenceViewController
- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SC_Width, SC_Height)];
        [self.view addSubview:sv];
        _contentView = sv;
    }
    return _contentView;
}
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
    
    [self.view bringSubviewToFront:self.titleView];
    self.contentView.delegate = self;
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
        [btn addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        btn.backgroundColor = RandomColor;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateDisabled];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        x = width * i;
        btn.frame = (CGRect){{x, y}, {width, height}};
        [self.titleView addSubview:btn];
        if (i == 0) {
            // 让按钮内部的label根据内容计算尺寸
            [btn.titleLabel sizeToFit];
            btn.enabled = NO;
            self.indicatorBar.width = btn.titleLabel.width;
            self.indicatorBar.center = btn.center;
            self.indicatorBar.y = height;
            self.indicatorBar.centerX = btn.centerX;
            self.selectedBtn = btn;
        }
    }
    self.indicatorBar.tag = titleCount;
}

- (void)leftBarClicked {
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)titleButtonClicked:(UIButton *)sender {
    self.selectedBtn.enabled = YES;
    self.selectedBtn = sender;
    sender.enabled = NO;
    //
    [UIView animateWithDuration:0.3 animations:^{
        self.indicatorBar.centerX = sender.centerX;
        self.contentView.contentOffset = CGPointMake(sender.tag * SC_Width, 0);
    }];
}

#pragma -mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // title
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = (scrollView.contentOffset.x / SC_Width);
    self.selectedBtn.enabled = YES;
    for (UIButton *btn in self.titleView.subviews) {
        if (btn.tag == index) {
            self.selectedBtn = btn;
            break;
        }
    }
    self.selectedBtn.enabled = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorBar.centerX = self.selectedBtn.centerX;
    }];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
}

@end


















