//
//  JLRecomendCell.m
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLRecomendCell.h"

@interface JLRecomendCell ()

@property (weak, nonatomic) IBOutlet UIView *leftLine;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation JLRecomendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.backgroundColor = [UIColor lightGrayColor];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.leftLine.backgroundColor = [UIColor lightGrayColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    UIColor *redColor = [UIColor redColor];
    UIColor *lightGrayColor = [UIColor lightGrayColor];
    self.leftLine.backgroundColor = selected ? redColor : lightGrayColor;
    self.nameLabel.textColor = selected ? redColor : [UIColor blackColor];
    
}

- (void)setModel:(JLRecomendList *)model {
    _model = model;
    self.nameLabel.text = model.name;
}

@end






