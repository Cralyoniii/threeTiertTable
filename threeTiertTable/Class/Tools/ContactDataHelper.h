//
//  ContactDataHelper.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef ContactDataHelper_h
#define ContactDataHelper_h


#endif /* ContactDataHelper_h */
#import "ContactModel.h"
@class ContactDataHelperModel;
@interface ContactDataHelper:NSObject
+ (NSMutableArray *) getFriendListDataBy:(NSMutableArray *)array;//获得通讯录名字数组
+ (NSMutableArray *) getFriendListSectionBy:(NSMutableArray *)array;//获得通讯录快速搜索首字母数组

@end
@interface ContactDataHelperModel : NSObject

@property(nonatomic, strong)NSString *type;
@property(nonatomic, strong)NSArray <ContactModel *>*modelArr;

@end

