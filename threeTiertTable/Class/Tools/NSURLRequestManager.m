//
//  NSURLRequestManager.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "NSURLRequestManager.h"
#import "AppClient.h"
static NSURLRequestManager *manager = nil;
@interface NSURLRequestManager()

@end


@implementation NSURLRequestManager
#pragma mark--初始化实例
+ (instancetype)shareInstance{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if(manager == nil){
            manager = [[NSURLRequestManager alloc]init];
        }
    });
    return manager;
}

#pragma mark--rechableility
- (BOOL)isNetworkReachabilityWithURLString:(NSString *)urlStr{
    __block BOOL netState = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusUnknown:
                netState = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWWAN:
                netState=YES;
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return YES;
}

/**
 post 请求
 @param requestUrlString 请求的url
 @param parameter 入参
 @param block 成功的block回调
 @param failureBlock 网络失败的block回调
 @return <#return value description#>
 */
#pragma mark--post
- (void)NetPOSTWithURL:(NSString *)requestUrlString
         WithParameter:(NSDictionary *)parameter
  WithReturnValueBlock:(returnValueBlock)block
      WithFailureBlock:(failureBlock)failureBlock{
    AFHTTPSessionManager *manager=[AppClient sharedClient];
    requestUrlString = [[NSURL URLWithString:requestUrlString relativeToURL:manager.baseURL] absoluteString];
    [manager POST:requestUrlString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        block(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}
/**
 @param requestUrlString 请求的url
 @param parameter 入参
 @param block 成功的block 回调
 @param failureBlock 网络失败的block回调

 @return <#return value description#>
 */
#pragma mark--get
- (void)NetGETWithURL:(NSString *)requestUrlString
        WithParameter:(NSDictionary *)parameter
 WithReturnValueBlock:(returnValueBlock)block
     WithFailureBlock:(failureBlock)failureBlock{
    AFHTTPSessionManager *manager=[AppClient sharedClient];
    requestUrlString = [[NSURL URLWithString:requestUrlString relativeToURL:manager.baseURL] absoluteString];
    [manager GET:requestUrlString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
//下载文件写在这里
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}
@end
