//
//  VKCFriendsProcessor.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCFriendsProcessor.h"
#import "VKCPolygon.h"

@implementation VKCFriendsProcessor

+ (id)sharedInstance {
    static VKCFriendsProcessor *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCFriendsProcessor alloc] init]; });
    return instance;
}

- (id)process:(NSData *)jsonData {
    if (jsonData) {
        NSError *error;
        NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        
//        if (error == noErr) {
//            NSArray *friendsArray = []
//        }
    }
    return nil;
}

- (NSString *)getName {
    return nil;
}

@end
