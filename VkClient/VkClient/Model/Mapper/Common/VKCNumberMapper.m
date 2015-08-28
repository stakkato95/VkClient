//
//  VKCStringMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCNumberMapper.h"

@implementation VKCNumberMapper

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    if (sourceObject) {
        return [[[NSNumberFormatter alloc] init] numberFromString:sourceObject];
    }
    return nil;
}

@end
