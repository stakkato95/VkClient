//
//  NSStringExtension.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCNSString.h"

@implementation NSString (VKCNSString)

NSString * const EMPTY_STRING = @"";
char const WHITE_SPACE_CHAR = ' ';

- (BOOL)vkc_isNilOrEmpty {
    return !self || [self isEqual:EMPTY_STRING];
}

- (BOOL)vkc_isNilOrWhiteSpace {
    if (!self) {
        return YES;
    }
    
    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] != WHITE_SPACE_CHAR) {
            return NO;
        }
    }
    return YES;
}

@end