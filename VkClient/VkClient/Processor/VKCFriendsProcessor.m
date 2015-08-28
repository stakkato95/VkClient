//
//  VKCFriendsProcessor.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCFriendsProcessor.h"

@implementation VKCFriendsProcessor

+ (instancetype)sharedInstance {
    static VKCFriendsProcessor *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCFriendsProcessor alloc] init]; });
    return instance;
}

- (id)process:(NSData *)jsonData error:(NSError *)error {
    NSArray *friendsArray = nil;
    
    if (jsonData) {
        NSDictionary *preparedJson = [[VKCJSONSerializationUtil sharedInstance] serialize:jsonData error:error];
        if (error == noErr) {
            friendsArray = [[[VKCUserMapper alloc] init] mapFromSourceObject:preparedJson error:error];
            if (error != noErr) {
                return nil;
            }
        }
    }
    return friendsArray;
}

- (NSString *)getName {
    return NSStringFromClass(self.class);
}

@end
