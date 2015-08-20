//
//  VKCApi.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCApi : NSObject

extern NSString * const VK_COM;
extern NSString * const METHOD_PATH;
extern NSString * const OAUTH_PATH;

+ (VKCApi *)sharedInstance;
- (NSURLRequest *)getOAuthRequest;
- (BOOL)checkForToken:(NSURLRequest *)urlRequest;

@end
