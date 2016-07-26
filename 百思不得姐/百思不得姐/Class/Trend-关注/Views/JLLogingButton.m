//
//  JLLogingButton.m
//  百思不得姐
//
//  Created by kfz on 16/7/26.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLLogingButton.h"

@implementation JLLogingButton

- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super initWithCoder:aDecoder] ) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = 0;
    CGFloat width = self.width;
    self.imageView.width = width;
    self.imageView.height = width;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = width;
    self.titleLabel.width = width;
    self.titleLabel.height = self.height - width;
    
}

@end
