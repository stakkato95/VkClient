//
//  VKCVKResponseObject.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCVKResponse.h"

@implementation VKCVKResponse

#pragma mark - KVC compliance methods

- (BOOL)validateResponse:(id *)ioValue error:(NSError *__autoreleasing *)outError {
    if (ioValue && [*ioValue isKindOfClass:[VKCVKArrayWrap class]]) {
        return YES;
    }
    return NO;
}

@end
