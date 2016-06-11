//
//  JLNetTool.m
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "JLNetTool.h"
#import <AFNetworking.h>


@implementation JLNetTool

/**
 * 推荐关注-用户列表
 */
+ (void)getRecomendUserListId:(NSInteger)ID page:(NSInteger)page Success:(Success _Nonnull)success failure:(Failure _Nonnull)failure {
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *params = @{
                             @"a" : @"list",
                             @"c" : @"subscribe",
                             @"category_id" : @(ID),
                             @"page" : @(page)
                             };
    [self get:urlString params:params success:success failure:failure];
    
}
/*
 // 发送请求给服务器, 加载右侧的数据
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
 params[@"a"] = @"list";
 params[@"c"] = @"subscribe";
 params[@"category_id"] = @(c.id);
 [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" p
 */

/**
 * 推荐关注-左边列表
 */
+ (void)getRecomendCategorySuccess:(Success _Nonnull)success failure:(Failure _Nonnull)failure {
    NSString *urlString = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *params = @{
                             @"a" : @"category",
                             @"c" : @"subscribe"
                             };
    [self get:urlString params:params success:success failure:failure];
    /**
     params[@"a"] = @"category";
     params[@"c"] = @"subscribe";
     [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" pa
     */
}



//////
+ (void)get:(NSString * _Nonnull)urlString params:(NSDictionary * _Nonnull)params success:(Success _Nonnull)success failure:(Failure _Nonnull)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:success failure:failure];
}

+ (void)post:(NSString * _Nonnull)urlString params:(NSDictionary * _Nonnull)params success:(Success _Nonnull)success failure:(Failure _Nonnull)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:success failure:failure];
}

@end


















