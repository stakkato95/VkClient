//
//  NSStringExtension.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "NSString+StringAdditions.h"

@implementation NSString (StringAdditions)

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

- (NSString *)vkc_trimStringBetween:(NSString *)start and:(NSString *)end {
    NSRange startRange = [self rangeOfString:start];
    int secondRangeStart = startRange.location + startRange.length;
    NSRange secondSubstringRange = NSMakeRange(secondRangeStart, self.length - secondRangeStart);
    
    NSRange endRange;
    if (end.length == 0) {
        endRange = NSMakeRange(self.length, 0);
    } else {
        endRange = [self rangeOfString:end options:kNilOptions range:secondSubstringRange];
    }
    
    return [self substringWithRange:NSMakeRange(startRange.location + start.length, endRange.location - startRange.location - start.length)];
}

@end
