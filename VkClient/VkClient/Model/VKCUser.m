//
//  VKCUser.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCUser.h"

@implementation VKCUser

#pragma mark - Json constants

static NSString * const FIRST_NAME = @"first_name";
static NSString * const LAST_NAME = @"last_name";
static NSString * const ONLINE = @"online";
static NSString * const HIDDEN = @"hidden";

#pragma mark - Accessors

- (NSString *)firstName {
    return [self getString:FIRST_NAME];
}

- (NSString *)lastName {
    return [self getString:LAST_NAME];
}

- (BOOL)isOnline {
    return [self getBool:ONLINE];
}


@end
