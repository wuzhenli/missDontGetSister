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


@interface JLRecomendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray <JLRecomendList *>*categoryList;
@property (strong, nonatomic) NSArray <JLUser *>*userList;

@property (weak, nonatomic) IBOutlet UITableView *categoryView;
@property (weak, nonatomic) IBOutlet UITableView *userView;


@end

static NSString *recomendID = @"recomend_cell";
static NSString *userID = @"user_cell";

@implementation JLRecomendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
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
        return self.userList.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell  = nil;
    if (tableView == self.categoryView) {
        cell = [tableView dequeueReusableCellWithIdentifier:recomendID];
        ((JLRecomendCell *)cell).model = self.categoryList[indexPath.row];
    } if (tableView == self.userView) {
        cell = [tableView dequeueReusableCellWithIdentifier:userID];
        ((JLUserCell *)cell).model = self.userList[indexPath.row];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryView) {
        JLRecomendList *list = self.categoryList[indexPath.row];
        [JLNetTool getRecomendUserListId:list.ID  Success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            self.userList = [JLUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"] context:nil];
            [self.userView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            ;
        }];
    } if (tableView == self.userView) {
        
    }
    
    
}



@end























