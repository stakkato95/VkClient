//
//  VKCApi.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"

@interface VKCApi : NSObject <VKCSingleton> {
    @private
    NSString *token;
}

extern NSString * const VK_COM;
extern NSString * const OAUTH_PATH;
extern NSString * const EXPIRES_IN;

+ (VKCApi *)sharedInstance;
- (NSURLRequest *)getOAuthRequest;
- (BOOL)checkForToken:(NSURLRequest *)urlRequest;
- (void)setToken: (NSString *)tokenString;

@end
