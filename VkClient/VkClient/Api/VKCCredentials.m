//
//  VKCCredentials.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCCredentials.h"

@implementation VKCCredentials

+ (instancetype)credentialsWithToken:(NSString *)token
                              userId:(NSString *)userId
                      expirationDate:(NSString *)expirationDate {
    VKCCredentials *credentials = [[VKCCredentials alloc] init];
    credentials.token = token;
    credentials.userId = userId;
    credentials.expirationDate = expirationDate;
    return credentials;
}

- (NSData *)tokenData {
    return [self.token dataUsingEncoding:NSUTF8StringEncoding];
}

@end
