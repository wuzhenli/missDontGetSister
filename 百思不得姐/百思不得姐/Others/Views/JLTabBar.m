//
//  JLTabBar.m
//  百思不得姐
//
//  Created by kfz on 16/5/29.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLTabBar.h"

@interface JLTabBar ()

@property (weak, nonatomic) UIButton *addButton;

@end

@implementation JLTabBar

- (UIButton *)addButton {
    if (!_addButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _addButton = btn;
        //
        UIImage *img = [UIImage imageNamed:@"tabBar_publish_icon"];
        UIImage *imgHeight = [UIImage imageNamed:@"tabBar_publish_click_icon"];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [btn setBackgroundImage:imgHeight forState:UIControlStateHighlighted];
    }
    return _addButton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize btnSize = self.addButton.currentBackgroundImage.size;
    self.addButton.bounds = (CGRect){{0, 0}, btnSize};
    self.addButton.center = (CGPoint) {self.frame.size.width / 2., self.frame.size.height/2.};
    
    
    CGFloat width = (self.frame.size.width) / 5;
    CGFloat height = self.frame.size.height;
    CGFloat x = 0;
    CGFloat y = 0;
    NSInteger i = 0;
    
    for (UIView *btn in self.subviews) {
        if ( [btn isKindOfClass:[UIControl class]] ) {
            if (btn == self.addButton) continue;
            x = (i>1 ? i+1 : i) * width ;
            btn.frame = (CGRect){{x, y}, {width, height}};
            i++;
        }
        
    }
    
}

@end























