//
//  JLRecomendList.h
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLUser.h"


@interface JLRecomendList : NSObject

@property (strong, nonatomic) NSMutableArray <JLUser *>*users;
@property (assign, nonatomic) NSUInteger totalPage;
@property (assign, nonatomic) NSUInteger nextPage;



@property (assign, nonatomic) NSUInteger count;

@property (assign, nonatomic) NSUInteger ID;

@property (copy, nonatomic) NSString *name;

//{
//    count = 169;
//    id = 16;
//    name = "\U539f\U521b";
//}

//"next_page" = 2;
//total = 39;
//"total_page" = 2;


@end
