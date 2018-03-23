//
//  MainVC.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "MainVC.h"
#import "MainTableViewModel.h"
#import "MainViewModel.h"
@interface MainVC()
@property (nonatomic, strong)NSMutableArray <ContactModel *> * modelArr;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)MainTableViewModel *tableModel;
@property (nonatomic, strong)MainViewModel *viewModel;
@end

@implementation MainVC
- (void)dealloc{
    
}
#pragma mark-- UI life
- (void)viewDidLoad{
    [super viewDidLoad];
//    [self configureTableView];
    [self getData];
    [self setNeedsStatusBarAppearanceUpdate];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
#pragma mark--重写statusBarStyle方法
- (UIStatusBarStyle )preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/**
 模拟获取数据

 @return 返回具体数据
 */
#pragma mark--获取数据
- (void)getData{
//    配置列表
    [self.tableModel handleWithTable:self.tableView withSourceView:self];
    Weak(weakSelf, self);
//    设置数据
    [self.viewModel setBlockWithReturnValueBlock:^(id returnValue) {
        KLOG(@"%@",returnValue);
        [weakSelf.tableModel getMainDataWithModelArray:^NSMutableArray<FatherContactGroupModel *> *{
            NSMutableArray <FatherContactGroupModel *>*arr = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:returnValue[@"groups"]];
            return arr;
        } completion:^{
            [weakSelf.tableView reloadData];
        }];
    } WithErrorBlock:^(id errorCode) {
        KLOG(@"code:%@",errorCode);
    } WithFailBlock:^{
        [weakSelf.tableModel getMainDataWithModelArray:^NSMutableArray<FatherContactGroupModel *> *{
            NSArray *arr = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"233"];
            NSMutableArray <FatherContactGroupModel *>*arr1 = [NSMutableArray array];
            for(int i=0 ;i<9;i++){
                FatherContactGroupModel *model1 = [[FatherContactGroupModel alloc]init];
                model1.name = [NSString stringWithFormat:@"%@办公室",arr[i]];
                model1.parentNode = -1;
                model1.realNode = 0;
                NSMutableArray <FatherContactGroupModel *> *arr3 = [NSMutableArray array];
                for(int j=0;j<2;j++){
                    FatherContactGroupModel *model2 = [[FatherContactGroupModel alloc]init];
                    model2.parentNode = 0;
                    model2.realNode = 1;
                    model2.name = [NSString stringWithFormat:@"     %@尼玛",arr[i]];
                    NSMutableArray <FatherContactGroupModel *>*arr4 = [NSMutableArray array];
                    for(int k=0;k<3;k++){
                        FatherContactGroupModel *model3 = [[FatherContactGroupModel alloc]init];
                        model3.parentNode = 1;
                        model3.realNode = 2;
                        model3.name = [NSString stringWithFormat:@"         %@雷猴",arr[i]];
                        NSMutableArray *arr5 = [NSMutableArray array];
                        for(int l = 0;l<1;l++){
                            FatherContactGroupModel *model4 = [[FatherContactGroupModel alloc]init];
                            model4.parentNode = 2;
                            model4.realNode = 3;
                            model4.name =[NSString stringWithFormat:@"              %@最后一个",arr[i]];
                            [arr5 addObject:model4];
                        }
                        model3.sunGroups = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:arr5];
                        [arr4 addObject:model3];
                    }
                    model2.sunGroups = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:arr4];
                    [arr3 addObject:model2];
                }
                model1.sunGroups = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:arr3];
                [arr1 addObject:model1];
            }
            return arr1;
        } completion:^{
            [weakSelf.tableView reloadData];
        }];
    }];
//    触发请求数据
    [self.viewModel fetchMainTableViewDataWithMainViewController:self];
}
#pragma mark--lazy load

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _tableView.backgroundColor = [UIColor greenColor];
//        _tableView.sectionHeaderHeight = 0.0;
//        _tableView.sectionFooterHeight = 0.0;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (MainTableViewModel *)tableModel{
    if(_tableModel == nil){
        _tableModel = [[MainTableViewModel alloc]init];
    }
    return _tableModel;
}
- (MainViewModel *)viewModel{
    if(_viewModel == nil){
        _viewModel = [[MainViewModel alloc]init];
    }
    return _viewModel;
}
- (NSMutableArray <ContactModel *>*)modelArr{
    if(!_modelArr){
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}
@end
