//
//  NSURLRequestManager.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef NSURLRequestManager_h
#define NSURLRequestManager_h


#endif /* NSURLRequestManager_h */
#define NSURLRequestManagetShareInstance [NSURLRequestManager shareInstance]
@interface NSURLRequestManager : NSObject


#pragma mark-- instance
+ (instancetype)shareInstance;

#pragma mark--网络可用性
- (BOOL)isNetworkReachabilityWithURLString:(NSString *) urlStr;


#pragma mark-- GET

- (void)NetGETWithURL:(NSString *) requestUrlString
        WithParameter:(NSDictionary *) parameter
 WithReturnValueBlock:(returnValueBlock) block

     WithFailureBlock:(failureBlock) failureBlock;

#pragma mark-- POST
- (void)NetPOSTWithURL:(NSString *) requestUrlString
         WithParameter:(NSDictionary *) parameter
  WithReturnValueBlock:(returnValueBlock) block
      WithFailureBlock:(failureBlock) failureBlock;


@end
