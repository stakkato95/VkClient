//
//  VKCVKArray.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCVKArrayWrap.h"

@implementation VKCVKArrayWrap

- (BOOL)validateItems:(id *)ioValue error:(NSError *__autoreleasing *)outError {
    if (ioValue && [*ioValue isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

@end
