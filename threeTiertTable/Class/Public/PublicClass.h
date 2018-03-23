//
//  PublicClass.h
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#ifndef PublicClass_h
#define PublicClass_h


#endif /* PublicClass_h */
typedef void (^returnValueBlock)(id returnValue);

typedef void (^errorCodeBlock)(id errorCode);

typedef void (^failureBlock)(void);

typedef void (^netWorkBlock)(BOOL netConnetState);

#define KLOG(XX,...) NSLog(@"%s(%d): " XX,__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#define Weak(weakobj, obj)      __weak __typeof(&*obj)weakobj = obj
