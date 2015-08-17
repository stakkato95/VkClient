//
//  VKCApi.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCApi : NSObject

extern NSString * const METHOD_PATH;
extern NSString * const OAUTH_PATH;

+ (VKCApi *)sharedApi;
- (NSURLRequest *)getOAuthPath;
- (BOOL)checkForToken:(NSURLRequest *)urlRequest;

@end
