//
//  JLRecomendViewController.m
//  百思不得姐
//
//  Created by kfz on 16/6/10.
//  Copyright © 2016年 kongfz. All rights reserved.
//  推荐关注";

#import "JLRecomendViewController.h"
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "JLRecomendList.h"
#import "JLRecomendCell.h"
#import "JLUser.h"
#import "JLUserCell.h"
#import <MJRefresh.h>


@interface JLRecomendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray <JLRecomendList *>*categoryList;
@property (strong, nonatomic) NSArray <JLUser *>*userList;

@property (weak, nonatomic) IBOutlet UITableView *categoryView;
@property (weak, nonatomic) IBOutlet UITableView *userView;

@property (assign, nonatomic) NSUInteger categoryIndex;

@end

static NSString *recomendID = @"recomend_cell";
static NSString *userID = @"user_cell";

@implementation JLRecomendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
    [self addRefresh];
}

- (void)addRefresh {
    self.userView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(userRefresh)];
    [self.userView.mj_header beginRefreshing];
    
    self.userView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(userLoadMore)];
}

- (void)setUp {
    self.title = @"推荐关注";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.userView.rowHeight = 60;
    
    // 注册“cell”
    [self.categoryView registerNib:[UINib nibWithNibName:@"JLRecomendCell" bundle:nil] forCellReuseIdentifier:recomendID];
    [self.userView registerNib:[UINib nibWithNibName:@"JLUserCell" bundle:nil] forCellReuseIdentifier:userID];
    
    [SVProgressHUD showWithStatus:@"loading"];
    
    [JLNetTool getRecomendCategorySuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.categoryList = [JLRecomendList mj_objectArrayWithKeyValuesArray:responseObject[@"list"] context:nil];
        [self.categoryView reloadData];
        [self.categoryView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
    }];
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma -mark TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.categoryView) {
        return self.categoryList.count;
    }else if (tableView == self.userView) {
        return self.categoryList[self.categoryIndex].users.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell  = nil;
    if (tableView == self.categoryView) {
        cell = [tableView dequeueReusableCellWithIdentifier:recomendID];
        ((JLRecomendCell *)cell).model = self.categoryList[indexPath.row];
    } if (tableView == self.userView) {
        NSLog(@"------categoryIndex:%ld  indexPath.row:%ld",self.categoryIndex, indexPath.row);
        cell = [tableView dequeueReusableCellWithIdentifier:userID];
//        NSLog(@"indexPath.row:%ld--users.count:%ld",indexPath.row,self.categoryList[self.categoryIndex].users.count);
        ((JLUserCell *)cell).model = self.categoryList[self.categoryIndex].users[indexPath.row];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryView) {
        self.categoryIndex = indexPath.row;
        if ( self.categoryList[indexPath.row].users.count ) {
            [self.userView reloadData];
            return;
        }
        
        [self .userView.mj_header beginRefreshing];
    } if (tableView == self.userView) {
        
    }
}



#pragma -mark 刷新控件-方法
/**
 * 下拉刷新
 */
- (void)userRefresh {
    JLRecomendList *list = self.categoryList[self.categoryIndex];
    [JLNetTool getRecomendUserListId:list.ID page:1  Success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        list.users = [JLUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"] context:nil];
        list.totalPage = [responseObject[@"total_page"] integerValue];
        list.nextPage = [responseObject[@"next_page"] integerValue];
        
        [self.userView reloadData];
        [self.userView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.userView.mj_header endRefreshing];
    }];
}

/**
 * 上拉加载更多
 */
- (void)userLoadMore {
    JLRecomendList *list = self.categoryList[self.categoryIndex];
    if (list.nextPage > list.totalPage) {
        [self.userView.mj_footer endRefreshing];
        return;
    }

    [JLNetTool getRecomendUserListId:list.ID page:list.nextPage++  Success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *users = [JLUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"] context:nil];
        list.totalPage = [responseObject[@"total_page"] integerValue];
        
        [list.users addObjectsFromArray:users];
        [self.userView reloadData];
        [self.userView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.userView.mj_footer endRefreshing];
    }];
}

@end























