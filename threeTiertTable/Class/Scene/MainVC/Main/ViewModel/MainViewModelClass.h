//
//  MainViewModelClass.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef MainViewModelClass_h
#define MainViewModelClass_h


#endif /* MainViewModelClass_h */
@interface MainViewModelClass : NSObject

@property (strong, nonatomic) returnValueBlock returnValueBlock;

@property (strong, nonatomic) errorCodeBlock errorCodeBlock;

@property (strong, nonatomic) failureBlock failureBlock;

- (void)setBlockWithReturnValueBlock: (returnValueBlock) returnBlock
                      WithErrorBlock: (errorCodeBlock) errorBlock
                       WithFailBlock: (failureBlock) failureBlock;

@end
