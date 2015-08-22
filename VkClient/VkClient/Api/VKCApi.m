//
//  VKCApi.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCApi.h"
#import "VKCTokenStorage.h"

@implementation VKCApi

#pragma mark - Constants

NSString * const VK_COM = @"vk.com";
NSString * const OAUTH_PATH = @"https://oauth.vk.com/authorize?client_id=%d&display=mobile&redirect_uri=%@&scope=%@&response_type=token&v=%g";
int const CLIENT_ID = 5034492;
NSString * const REDIRECT_URI = @"http://localhost";
NSString * const SCOPE = @"friends,status";
double const API_VERSION = 5.37;
NSString * const ACCESS_TOKEN = @"access_token";

NSString * const METHOD_PATH = @"https://api.vk.com/method/";

#pragma mark - Methods

+ (VKCApi *)sharedInstance {
    static VKCApi *api = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ api = [[VKCApi alloc] init]; });
    return api;
}

- (NSURLRequest *)getOAuthRequest {
    NSURL *authUrl = [NSURL URLWithString:[NSString stringWithFormat:OAUTH_PATH, CLIENT_ID, REDIRECT_URI, SCOPE, API_VERSION]];
    return [NSURLRequest requestWithURL:authUrl];
}

- (BOOL)checkForToken:(NSMutableURLRequest *)request {
    NSString *urlString = request.URL.absoluteString;
    if ([urlString containsString:ACCESS_TOKEN]) {
        [[VKCTokenStorage sharedInstance] retain:urlString];
        return YES;
    }
    return NO;
}

- (void)setToken: (NSString *)tokenString {
    self->token = token;
}

@end
