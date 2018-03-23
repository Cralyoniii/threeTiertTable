//
//  MainViewModel.m
//  threeTiertTable
//
//  Created by kim on 14/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "MainViewModel.h"
@interface MainViewModel()

@end


@implementation MainViewModel
- (void)fetchMainTableViewDataWithMainViewController:(UIViewController *)VC{
    [NSURLRequestManagetShareInstance NetPOSTWithURL:@"gogogo" WithParameter:@{}
                                WithReturnValueBlock:^(id returnValue) {
                                    if(![returnValue[@"result"] isEqualToString:@"success"]){
                                        self.errorCodeBlock(returnValue[@"errCode"]);
                                    }else{
                                        self.returnValueBlock(returnValue);
                                    }
                                }
                                    WithFailureBlock:^{
                                       
                                        self.failureBlock();
                                    } ];
}

@end
