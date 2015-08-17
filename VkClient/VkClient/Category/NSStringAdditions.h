//
//  NSStringExtension.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringAdditions)

extern NSString * const EMPTY_STRING;
extern char const WHITE_SPACE_CHAR;

//NEED PREFIX vkc_ TO AVOID CODE CLASHES
- (BOOL)vkc_isNilOrEmpty;
- (BOOL)vkc_isNilOrWhiteSpace;

@end
