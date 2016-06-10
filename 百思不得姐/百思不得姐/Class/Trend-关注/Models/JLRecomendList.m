//
//  JLRecomendList.m
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLRecomendList.h"
#import <MJExtension.h>

@implementation JLRecomendList

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{ // 字典中的key是属性名，value是从字典中取值用的key
             @"ID" : @"id"
             };
}

@end
