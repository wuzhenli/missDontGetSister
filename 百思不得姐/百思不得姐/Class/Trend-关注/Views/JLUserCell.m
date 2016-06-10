//
//  JLUserCell.m
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLUserCell.h"
#import <UIImageView+WebCache.h>

@interface JLUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *trendCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation JLUserCell

- (void)setModel:(JLUser *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.trendCountLabel.text = [NSString stringWithFormat:@"%ld人关注",model.fans_count];
    self.nameLabel.text = model.screen_name;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end














