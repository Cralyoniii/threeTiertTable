//
//  ContactModel.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactModel.h"
#import "NSString+Uitils.h"
@implementation ContactModel
- (void)setName:(NSString *)name{
    if(name){
        _name = name;
        _pinyin = name.pinyin;
    }
}

@end
@implementation FatherContactGroupModel

- (void)setGroups:(NSArray *)groups{
    _sunGroups = [FatherContactGroupModel mj_objectArrayWithKeyValuesArray:groups];
}

@end
