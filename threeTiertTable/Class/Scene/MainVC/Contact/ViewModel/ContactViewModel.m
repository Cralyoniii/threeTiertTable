//
//  ContactViewModel.m
//  threeTiertTable
//
//  Created by kim on 22/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "ContactViewModel.h"
@interface ContactViewModel()

@end

@implementation ContactViewModel

- (void)fetchContactDataWithSourceView:(UIViewController *)vc{
//    vc.view.backgroundColor= [UIColor colorWithRed:30 green:40 blue:100 alpha:0.3];
    [NSURLRequestManagetShareInstance NetPOSTWithURL:@"" WithParameter:@{} WithReturnValueBlock:^(id returnValue) {
        if([returnValue[@"errCode"] integerValue] == 200){
            self.returnValueBlock(returnValue);
        }else{
            self.errorCodeBlock(@"2333");
        }
    } WithFailureBlock:^{
        self.failureBlock();
    }];
}

@end
