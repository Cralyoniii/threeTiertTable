//
//  AppClient.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "AppClient.h"
static NSString * const APIBaseURL = @"http://www.baidu.com";

@implementation AppClient

+ (instancetype)sharedClient{
    static AppClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AppClient alloc]initWithBaseURL:[NSURL URLWithString:APIBaseURL]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    if(self == [super initWithBaseURL:url]){
        //请求超时时间
        self.requestSerializer.timeoutInterval = 3;
        
        //缓存策略
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
        
        //请求以及相应的序列化器
        self.requestSerializer = [AFJSONRequestSerializer serializer];//[AFHTTPRequestSerializer serializer];
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        self.responseSerializer = response;
        self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
       
        /**
         [self.requestSerializer setValue:value forHTTPHeaderField:key];
         用来设置http请求头，这里可以自定义，e.g:自定义UA，或者添加字段以及字段值
          */
        //设置json传值
        [self.requestSerializer setValue:@"kim" forHTTPHeaderField:@"User-Agent"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue:@"kimlinux" forHTTPHeaderField:@"token"];
        //接受的类型
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
    }
    return self;
}

@end
