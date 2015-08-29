//
//  VKCCredentials.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCCredentials : NSObject

@property NSString *token;
@property NSString *userId;
@property NSString *expirationDate;

+ (instancetype)credentialsWithToken:(NSString *)token
                              userId:(NSString *)userId
                      expirationDate:(NSString *)expirationDate;

- (NSData *)tokenData;

@end
