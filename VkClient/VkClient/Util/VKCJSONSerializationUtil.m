//
//  VKCJSONSerializationUtil.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCJSONSerializationUtil.h"

@implementation VKCJSONSerializationUtil

+ (instancetype)sharedInstance {
    static VKCJSONSerializationUtil *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCJSONSerializationUtil alloc] init]; });
    return instance;
}

- (NSDictionary *)serialize:(NSData *)jsonData error:(NSError *)error {
    return [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
}

@end
