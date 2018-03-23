//
//  MainViewModelClass.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "MainViewModelClass.h"
@implementation MainViewModelClass

- (void)setBlockWithReturnValueBlock:(returnValueBlock)returnBlock
                      WithErrorBlock:(errorCodeBlock)errorBlock
                       WithFailBlock:(failureBlock)failureBlock{
    _returnValueBlock = returnBlock;
    _errorCodeBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end
