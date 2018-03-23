//
//  MainTableViewModel.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//



#import "MainTableViewModel.h"
#import "MainTVCell.h"
#import "ContactTableView.h"
static NSString *cellId = @"cellId";
@interface MainTableViewModel()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray <FatherContactGroupModel *>*modelArr;

@property (nonatomic, strong)NSMutableArray <FatherContactGroupModel *>*AllDataArr;

@property (nonatomic, weak)UIViewController *controller;
@end

@implementation MainTableViewModel

- (void)getMainDataWithModelArray:(NSMutableArray<FatherContactGroupModel *> *(^)(void))modelArrayBlock completion:(void (^)(void))completion{
    if(modelArrayBlock){
        self.modelArr = modelArrayBlock();
        self.AllDataArr = modelArrayBlock();
        if(completion){
            completion();
        }
    }
}

- (void)handleWithTable:(UITableView *)table withSourceView:(UIViewController *)VC{
    _controller = VC;
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [table registerClass:[MainTVCell class] forCellReuseIdentifier:cellId];
}

#pragma mark--datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTVCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    cell.nameLabel.text = _modelArr[indexPath.row].name;
    Weak(weakSelf, self);
    cell.btnClickedBlock = ^{
        ContactTableView *vc = [[ContactTableView alloc]init];
        vc.title = weakSelf.modelArr[indexPath.row].name;
        [weakSelf.controller.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark--delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

/**
 这里是具体的数据操作

 @param tableView 分组表
 @param indexPath 具体的行
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FatherContactGroupModel *model = _modelArr[indexPath.row];
    if(model.sunGroups.count<=0){
        //这里可以用来进入具体的分组代表的内容页面
        return;
    }
    BOOL isExpand = NO;
    
    
    int count = 1;//这里用来记录一共更改了多少行cell
    if(model.isOpen){
        NSArray <FatherContactGroupModel *>*arr = [_modelArr mutableCopy];
        isExpand = NO;
        [_modelArr removeObject:model];
        model.isOpen = NO;
        [_modelArr insertObject:model atIndex:indexPath.row];
        for(int i =(int)indexPath.row+1;i<arr.count;i++){
            FatherContactGroupModel *model2 = arr[i];
            
            if(model.parentNode < model2.parentNode){
                [_modelArr removeObjectAtIndex:indexPath.row+1];
                count++;
            }else if(model.parentNode == model2.parentNode){
                break;
            }
        }
    }else{
        NSArray <FatherContactGroupModel *>*sunGroups ;
        if(model.parentNode>=0){
            sunGroups = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:model.sunGroups];
        }else{
            sunGroups = model.sunGroups;
        }
        for (int i=(int)indexPath.row+1;i<sunGroups.count+indexPath.row+1;i++){
            FatherContactGroupModel *model2 = sunGroups[i-indexPath.row-1];
            count++;
            if(i == sunGroups.count+indexPath.row){
                isExpand = YES;
                [_modelArr removeObject:model];
                model.isOpen = YES;
                [_modelArr insertObject:model atIndex:indexPath.row];
            }
            [_modelArr insertObject:model2 atIndex:i];
        }
    }
    
    NSMutableArray *indexpathArr = [NSMutableArray array];
    for(int i = (int)indexPath.row+1;i<indexPath.row+count;i++){
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        [indexpathArr addObject:index];
    }
    if(isExpand){
        [tableView insertRowsAtIndexPaths:indexpathArr withRowAnimation:UITableViewRowAnimationNone];
    }else{
        [tableView deleteRowsAtIndexPaths:indexpathArr withRowAnimation:UITableViewRowAnimationNone];
    }
}
#pragma mark--lazy load
- (NSMutableArray <FatherContactGroupModel *>*)modelArr{
    if(!_modelArr){
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}
- (NSMutableArray <FatherContactGroupModel *>*)AllDataArr{
    if(!_AllDataArr){
        _AllDataArr = [NSMutableArray array];
    }
    return _AllDataArr;
}
@end
