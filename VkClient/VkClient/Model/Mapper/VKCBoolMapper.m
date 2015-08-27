//
//  VKCBoolMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCBoolMapper.h"

@implementation VKCBoolMapper

- (BOOL)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    if (sourceObject) {
        return [sourceObject boolValue];
    }
    return NO;
}

@end
