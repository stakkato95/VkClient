//
//  VKCCredentialsUtil.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCCredentialsUtil.h"

@implementation VKCCredentialsUtil

+ (instancetype)sharedInstance {
    static VKCCredentialsUtil *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCCredentialsUtil alloc] init]; });
    return instance;
}

- (VKCCredentials *)parseCredentials:(NSString *)credentialsString {
    int tokenDurationInSecons = [[credentialsString vkc_trimStringBetween:[NSString stringWithFormat:@"%@=", EXPIRES_IN] and:@"&"] intValue];
    NSString *expirationDateString = [[[NSDate alloc] init] initWithTimeIntervalSinceNow:tokenDurationInSecons].description;
    NSString *token = [credentialsString vkc_trimStringBetween:@"=" and:@"&"];
    NSString *userId = [credentialsString vkc_trimStringBetween:[NSString stringWithFormat:@"%@=", USER_ID] and:@""];
    
    VKCCredentials *credentials = [VKCCredentials credentialsWithToken:token userId:userId expirationDate:expirationDateString];
    return credentials;
}

@end
