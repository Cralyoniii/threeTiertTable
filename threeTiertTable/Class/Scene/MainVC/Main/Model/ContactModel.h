//
//  ContactModel.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef ContactModel_h
#define ContactModel_h


#endif /* ContactModel_h */
@class FatherContactGroupModel;

@interface ContactModel : NSObject

@property(nonatomic, strong)NSString *phoneNumber;
@property(nonatomic, strong)NSString *email;
@property(nonatomic, strong)NSString *Area;
@property(nonatomic, strong)NSString *account;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *academy;
@property(nonatomic, strong)NSString *qq;
@property(nonatomic, strong)NSString *pinyin;
@property(nonatomic, assign)BOOL isOpen;//是否展开 开发者自己使用
@property(nonatomic, assign)BOOL isDetail; //是否为具体数据 开发者自己使用
@end

@interface FatherContactGroupModel : NSObject

@property (nonatomic, strong)NSNumber *id;

@property (nonatomic, assign)BOOL isOpen;//是否打开 开发者自己使用

@property (nonatomic, strong)NSString *name;//分组名字

@property (nonatomic,assign)NSInteger parentNode;//父节点 -1 为根

@property (nonatomic,assign)NSInteger realNode;

@property (nonatomic, strong)NSArray *groups;

@property (nonatomic, strong)NSArray <FatherContactGroupModel *>*sunGroups;

@end
