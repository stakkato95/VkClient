//
//  VKCNetworkSource.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCNetworkSource.h"

@implementation VKCNetworkSource

+ (instancetype)sharedInstance {
    static VKCNetworkSource *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCNetworkSource alloc] init]; });
    return instance;
}

- (NSData *)getData:(NSString *)parameter {
    NSURL *requestUrl = [NSURL URLWithString:parameter];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    NSURLResponse *response;
    NSError *error;
    return [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
}

- (NSString *)getName {
    return NSStringFromClass([self class]);
}

@end
