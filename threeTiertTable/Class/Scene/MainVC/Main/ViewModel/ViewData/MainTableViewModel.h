//
//  MainTableViewModel.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef MainTableViewModel_h
#define MainTableViewModel_h


#endif /* MainTableViewModel_h */
#import "MainViewModelClass.h"
#import "ContactModel.h"

@interface MainTableViewModel : NSObject


/**
 设置tableView

 @param table 分组列表
 @param VC 首页的ViewController
 */
- (void)handleWithTable:(UITableView *)table withSourceView:(UIViewController *)VC;

//- (void)pushViewControllerWithModel:(ContactModel *)model
//                 WithViewController:(UIViewController *)vc
//                       WithSourceVC:(UIViewController *)sourceVC;

/**
 配置数据源

 @param modelArrayBlock 数组
 @param completion 刷新时机
 */
- (void)getMainDataWithModelArray:(NSMutableArray <FatherContactGroupModel *>*(^)(void))modelArrayBlock
                   completion:(void(^)(void))completion;
@end
