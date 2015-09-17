//
//  VKCApi.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCAppDelegate.h"
#import "VKCSingleton.h"
#import "VKCCallback.h"
#import "VKCFriendsProcessor.h"
#import "VKCCredentialsStorage.h"
#import "VKCCredentials.h"
#import "VKCCredentialsUtil.h"
#import "VKCJSONConstants.h"

@interface VKCApi : NSObject <VKCSingleton>

extern NSString * const VK_COM;
extern NSString * const OAUTH_PATH;
extern NSString * const EXPIRES_IN;
extern NSString * const USER_ID;

- (NSURLRequest *)getOAuthRequest;

- (BOOL)checkForToken:(NSURLRequest *)urlRequest;

- (void)setCredentials:(VKCCredentials *)aCredentials;

- (void)getFriends:(id<VKCCallback>)callback;

@end
