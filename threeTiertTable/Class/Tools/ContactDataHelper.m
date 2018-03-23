//
//  ContactDataHelper.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//


#import "ContactDataHelper.h"

@implementation ContactDataHelper
+(NSMutableArray *)getFriendListDataBy:(NSMutableArray *)array{
    NSMutableArray <ContactDataHelperModel *>*ans=[[NSMutableArray alloc]init];
    
    NSArray *serializeArray=[(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        int i;
        NSString *strA=((ContactModel *)obj1).pinyin;
        NSString *strB=((ContactModel *)obj2).pinyin;
        for(i=0;i<strA.length&&i<strB.length;i ++){
            char a=[strA characterAtIndex:i];
            char b=[strB characterAtIndex:i];
            if(a>b){
                return (NSComparisonResult)NSOrderedDescending;
            }else if(a<b){
                return (NSComparisonResult)NSOrderedAscending;
            }
        }
        if(strA.length>strB.length){
            return (NSComparisonResult)NSOrderedDescending;
        }else if(strA.length<strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }else{
            return (NSComparisonResult)NSOrderedSame;
        }
        
    }];
    char lastC='1';
    NSMutableArray *data;
    NSMutableArray *oth=[[NSMutableArray alloc]init];
    int i=0;
    for(ContactModel *user in serializeArray){
        char c=[user.pinyin characterAtIndex:0];
        if(!isalpha(c)){
            [oth addObject:user];
        }
        else if(c!=lastC){
            
            if(data && data.count>0){
                ContactDataHelperModel *myModel = [[ContactDataHelperModel alloc]init];
                myModel.type = [NSString stringWithFormat:@"%c",toupper(lastC)];
                myModel.modelArr = [ContactModel mj_objectArrayWithKeyValuesArray:data];
                [ans addObject:myModel];
            }
            lastC=c;
            data=[[NSMutableArray alloc]init];
            [data addObject:user];
            
        }else{
            [data addObject:user];
            if(i == serializeArray.count-1){
                ContactDataHelperModel *myModel = [[ContactDataHelperModel alloc]init];
                myModel.type = [NSString stringWithFormat:@"%c",toupper(lastC)];
                myModel.modelArr = [ContactModel mj_objectArrayWithKeyValuesArray:data];
                [ans addObject:myModel];
            }
        }
        i++;
    }
    if(oth.count>0){
        ContactDataHelperModel *myModel = [[ContactDataHelperModel alloc]init];
        myModel.type = [NSString stringWithFormat:@"#"];
        myModel.modelArr = [ContactModel mj_objectArrayWithKeyValuesArray:oth];
        [ans addObject:myModel];
    }
    return ans;
    
}
+(NSMutableArray*)getFriendListSectionBy:(NSMutableArray *)array{
    NSMutableArray *section=[[NSMutableArray alloc]init];
    [section addObject:UITableViewIndexSearch];
    for (NSArray *item in array) {
        ContactModel *user=[item objectAtIndex:0];
        char c=[user.pinyin characterAtIndex:0];
        if(!isalpha(c)){
            c='#';
        }
        [section addObject:[NSString stringWithFormat:@"%c",toupper(c)]];
    }
    return section;
}
@end
@implementation ContactDataHelperModel


@end
