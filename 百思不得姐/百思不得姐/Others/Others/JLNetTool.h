//
//  JLNetTool.h
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^Failure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

@interface JLNetTool : NSObject

/**
 * 推荐关注-用户列表
 */
+ (void)getRecomendUserListId:(NSInteger)ID page:(NSInteger)page Success:(Success _Nonnull)success failure:(Failure _Nonnull)failure ;

/**
 * 推荐关注-左边列表
 */
+ (void)getRecomendCategorySuccess:(Success _Nonnull)success failure:(Failure _Nonnull)failure ;
@end
