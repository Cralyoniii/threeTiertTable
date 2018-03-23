//
//  NSString+Uitils.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "NSString+Uitils.h"

@implementation NSString (Uitils)
- (NSString *)pinyin{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}
@end
