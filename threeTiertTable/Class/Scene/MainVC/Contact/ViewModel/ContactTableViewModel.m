//
//  ContactTableViewModel.m
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactTableViewModel.h"
#import "ContactTVNameCell.h"
#import "ContactTVDetailCell.h"
#import "ContactDataHelper.h"

static NSString *nameId = @"nameId";
static NSString *detailId = @"detailId";

@interface ContactTableViewModel()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray <ContactModel *>*modelArr;

@property (nonatomic, strong)NSMutableArray <ContactModel *>*allDataArr;

@property (nonatomic, strong)NSMutableArray <ContactDataHelperModel *>*realModelArr;

@end
@implementation ContactTableViewModel

- (void)handleTableView:(UITableView *)table{
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:[ContactTVNameCell class] forCellReuseIdentifier:nameId];
    [table registerClass:[ContactTVDetailCell class] forCellReuseIdentifier:detailId];
}

- (void)getContactDataWithModelArray:(NSMutableArray<ContactModel *> *(^)(void))modelArrayBlock completion:(void (^)(void))completion{
    if(modelArrayBlock){
        self.modelArr = modelArrayBlock();
        self.realModelArr = [ContactDataHelper getFriendListDataBy:modelArrayBlock()];
        self.allDataArr = modelArrayBlock();
        if(completion){
            completion();
        }
    }
}

#pragma mark-- tableView delegate & dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactModel *model = self.realModelArr[indexPath.section].modelArr[indexPath.row];
    if(model.isDetail){
        return 120;
    }
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.realModelArr[section].modelArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.realModelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactModel *model = self.realModelArr[indexPath.section].modelArr[indexPath.row];
    if(model.isDetail){
        ContactTVDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:detailId];
        cell.model = model;
        return cell;
    }else{
        ContactTVNameCell *cell = [tableView dequeueReusableCellWithIdentifier:nameId];
        cell.nameStr = model.name;
        return cell;
    }
   
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [UILabel new];
    label.text = self.realModelArr[section].type;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.centerY.equalTo(view);
    }];
    
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactModel *model = self.realModelArr[indexPath.section].modelArr[indexPath.row];
    if(!model.isDetail){
        NSMutableArray <ContactModel *>*arr = [ContactModel mj_objectArrayWithKeyValuesArray:self.realModelArr[indexPath.section].modelArr];
        NSMutableArray <ContactModel *>*arr2 = [arr mutableCopy];
        ContactModel *addModel = arr2[indexPath.row];
        if(!model.isOpen){
            addModel.isDetail = YES;
            [arr insertObject:addModel atIndex:indexPath.row+1];
            model.isDetail = NO;
            model.isOpen = YES;
            [arr removeObjectAtIndex:indexPath.row];
            [arr insertObject:model atIndex:indexPath.row];
            self.realModelArr[indexPath.section].modelArr = [ContactModel mj_objectArrayWithKeyValuesArray:arr];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section], nil] withRowAnimation:UITableViewRowAnimationNone];
        }else{
            addModel.isDetail = NO;
            [arr removeObjectAtIndex:indexPath.row+1];
            model.isOpen = NO;
            model.isDetail = NO;
            [arr removeObjectAtIndex:indexPath.row];
            [arr insertObject:model atIndex:indexPath.row];
            self.realModelArr[indexPath.section].modelArr = [ContactModel mj_objectArrayWithKeyValuesArray:arr];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section], nil] withRowAnimation:UITableViewRowAnimationNone];
        }
    }else{
        
    }
}

#pragma mark--lazy load
- (NSMutableArray<ContactModel *>*)modelArr{
    if(!_modelArr){
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}
- (NSMutableArray <ContactModel *>*)allDataArr{
    if(!_allDataArr){
        _allDataArr = [NSMutableArray array];
    }
    return _allDataArr;
}
- (NSMutableArray <ContactDataHelperModel *>*)realModelArr{
    if(!_realModelArr){
        _realModelArr = [NSMutableArray array];
    }
    return _realModelArr;
}
@end
