//
//  NSStringExtension.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "NSStringAdditions.h"

@implementation NSString (NSStringAdditions)

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

+ (void)vkc_trimString:(NSString *) string betweenString:(NSString*)start andString:(NSString*)end {
    NSRange tokenRangeStart = [string rangeOfString:start];
    NSRange tokenRangeEnd = [string rangeOfString:end];
    string = [string substringWithRange:NSMakeRange(tokenRangeStart.location + 1, tokenRangeEnd.location - tokenRangeStart.location -1)];
}

@end
