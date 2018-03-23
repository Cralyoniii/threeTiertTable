//
//  ContactTableViewModel.h
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef ContactTableViewModel_h
#define ContactTableViewModel_h


#endif /* ContactTableViewModel_h */
#import "ContactModel.h"
@interface ContactTableViewModel : NSObject

- (void)handleTableView:(UITableView *)table;

//- (void)pushToVCwithSourceVC:(UIViewController *)sourceVC
//                    withData:(id)data
//                  withPushVC:(UIViewController *)pushVC;
- (void)getContactDataWithModelArray:(NSMutableArray <ContactModel *>*(^)(void))modelArrayBlock
                   completion:(void(^)(void))completion;
@end
