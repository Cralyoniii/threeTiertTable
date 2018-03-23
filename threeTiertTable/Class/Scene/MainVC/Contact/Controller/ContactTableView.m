//
//  ContactTableView.m
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactTableView.h"
#import "ContactViewModel.h"
#import "ContactTableViewModel.h"
@interface ContactTableView()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ContactViewModel *contactGetData;
@property (nonatomic, strong) ContactTableViewModel *contactVCModel;
@end

@implementation ContactTableView

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configureTableView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)configureTableView{
    Weak(weakSelf, self);
    
//    self.view.backgroundColor = [UIColor colorWithRed:30 green:40 blue:100 alpha:0.3];
//    这里设置背景色会报错，原因是在外部设置了颜色，不支持，有哪位大佬知道怎么解决的还请联系一下 gmail：18819439786kimlinux@gmail.com
    [self.contactVCModel handleTableView:self.tableView];
    [self.contactGetData setBlockWithReturnValueBlock:^(id returnValue) {
       [weakSelf.contactVCModel getContactDataWithModelArray:^NSMutableArray<ContactModel *> *{
           NSMutableArray <ContactModel *>*arr = [ContactModel mj_objectArrayWithKeyValuesArray:returnValue];
           return arr;
        } completion:^{
            [weakSelf.tableView reloadData];
        }];
    } WithErrorBlock:^(id errorCode) {
        KLOG(@"errCode:%@",errorCode);
    } WithFailBlock:^{
        [weakSelf.contactVCModel getContactDataWithModelArray:^NSMutableArray<ContactModel *> *{
            NSMutableArray <ContactModel *>*modelArr = [NSMutableArray array];
            NSArray *arr = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"233"];
            for(int i = 0;i<arr.count;i++){
                ContactModel *model = [[ContactModel alloc]init];
                model.name = [NSString stringWithFormat:@"%@雷猴",arr[i]];
                model.academy = [NSString stringWithFormat:@"%@氏孤儿",arr[i]];
                model.phoneNumber = @"1233312333";
                model.email = [NSString stringWithFormat:@"%@尼玛@qq.com",arr[i]];
                model.qq = @"103122333";
                [modelArr addObject:model];
            }
            return modelArr;
        } completion:^{
            [weakSelf.tableView reloadData];
        }];
    }];
    [self.contactGetData fetchContactDataWithSourceView:self];
}

#pragma mark -- layz load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (ContactViewModel *)contactGetData{
    if(!_contactGetData){
        _contactGetData = [[ContactViewModel alloc]init];
    }
    return _contactGetData;
}

- (ContactTableViewModel *)contactVCModel{
    if(!_contactVCModel){
        _contactVCModel = [[ContactTableViewModel alloc]init];
    }
    return _contactVCModel;
}

@end
