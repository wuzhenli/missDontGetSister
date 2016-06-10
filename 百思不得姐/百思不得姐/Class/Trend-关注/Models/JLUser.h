//
//  JLUser.h
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLUser : NSObject
//    "fans_count" = 7820;
@property (assign, nonatomic) NSUInteger fans_count;
//    gender = 1;
@property (assign, nonatomic) NSUInteger gender;
//    header = "http://wimg.spriteapp.cn/profile/large/2016/03/10/56e1265ccd17d_mini.jpg";
@property (copy, nonatomic) NSString *header;
//    introduction = "\U641e\U7b11\U7f8e\U5973\Uff0c\U6765\U5230\U82b1\U4e1b\U95f4\Uff0c\U9017\U4f60\U7b11\U7ffb\U5929";
@property (copy, nonatomic) NSString *introduction;
//    "is_follow" = 0;
@property (assign, nonatomic) BOOL is_follow;
//    "is_vip" = 0;
@property (copy, nonatomic) NSString *is_vip;
//    "screen_name" = "\U6728\U5b50\U5c0f\U4f73\U4f73";
@property (copy, nonatomic) NSString *screen_name;
//    "tiezi_count" = 11;
@property (assign, nonatomic) NSUInteger tiezi_count;
//    uid = 10354060;
@property (assign, nonatomic) NSUInteger uid;
//}
@end
