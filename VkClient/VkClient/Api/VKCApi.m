//
//  VKCApi.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCApi.h"

@implementation VKCApi

#pragma mark - Constants

NSString * const OAUTH_PATH = @"https://oauth.vk.com/authorize?client_id=%d&display=mobile&redirect_uri=%@&scope=%@&response_type=token&v=%g";
int const CLIENT_ID = 5034492;
NSString * const REDIRECT_URI = @"http://localhost";
NSString * const SCOPE = @"friends,status";
double const API_VERSION = 5.37;
NSString * const ACCES_TOKEN = @"access_token";

NSString * const METHOD_PATH = @"https://api.vk.com/method/";

#pragma mark - Methods

+ (NSURLRequest *)getOAuthPath {
    NSString *requestString = [NSString stringWithFormat:OAUTH_PATH, CLIENT_ID, REDIRECT_URI, SCOPE, API_VERSION];
    NSLog(requestString);
    NSURL *authUrl = [NSURL URLWithString:[NSString stringWithFormat:OAUTH_PATH, CLIENT_ID, REDIRECT_URI, SCOPE, API_VERSION]];
    return [NSURLRequest requestWithURL:authUrl];
}

+ (BOOL)checkForToken:(NSURLRequest *)urlRequest {
    NSString *urlString = urlRequest.URL.absoluteString;
    if ([urlString containsString:ACCES_TOKEN]) {
        NSRange tokenRangeStart = [urlString rangeOfString:@"=" ];
        NSRange tokenRangeEnd = [urlString rangeOfString:@"&" ];
        NSString *token = [urlString substringWithRange:NSMakeRange(tokenRangeStart.location, tokenRangeEnd.location - tokenRangeStart.location + 1)];
    }
    return NO;
}

@end
