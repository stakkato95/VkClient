//
//  VKCApi.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCApi.h"

@interface VKCApi ()

- (NSMutableString *)prepareRequestString:(NSDictionary *)headersMap;

@end

@implementation VKCApi {
    
    @private
    VKCCredentials *credentials;
    
}

#pragma mark - External constants

NSString * const VK_COM = @"vk.com";
NSString * const OAUTH_PATH = @"https://oauth.vk.com/authorize?client_id=%d&display=mobile&redirect_uri=%@&scope=%@&response_type=token&v=%g";
NSString * const EXPIRES_IN = @"expires_in";
NSString * const USER_ID = @"user_id";


#pragma mark - Internal constants

static int const CLIENT_ID = 5034492;
static NSString * const REDIRECT_URI = @"http://localhost";
static NSString * const SCOPE = @"friends,status";
static double const API_VERSION = 5.37;
static NSString * const ACCESS_TOKEN = @"access_token";
static NSString * const METHOD_PATH = @"https://api.vk.com/method/%@.%@?";


#pragma mark - Public methods

+ (instancetype)sharedInstance {
    static VKCApi *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCApi alloc] init]; });
    return instance;
}

- (NSURLRequest *)getOAuthRequest {
    NSURL *authUrl = [NSURL URLWithString:[NSString stringWithFormat:OAUTH_PATH, CLIENT_ID, REDIRECT_URI, SCOPE, API_VERSION]];
    return [NSURLRequest requestWithURL:authUrl];
}

- (BOOL)checkForToken:(NSMutableURLRequest *)request {
    NSString *urlString = request.URL.absoluteString;
    if ([urlString containsString:ACCESS_TOKEN]) {
        VKCCredentials *aCredentials = [[VKCCredentialsUtil sharedInstance] parseCredentials:urlString];
        if (aCredentials) {
            self->credentials = aCredentials;
            [[VKCCredentialsStorage sharedInstance] retainCredentials:aCredentials];
            return YES;
        }
    }
    return NO;
}

- (void)setCredentials:(VKCCredentials *)aCredentials {
    self->credentials = aCredentials;
}


#pragma mark - Get content methods

- (void)getFriends:(id<VKCCallback>)callback {
    NSString *requestString = [self prepareRequestString:[NSMutableDictionary dictionaryWithDictionary:@{METHOD_TYPE : METHOD_GET,
                                                                                                         DATA_TYPE : DATA_FRIENDS,
                                                                                                         USER_ID : credentials.userId,
                                                                                                         ORDER : ORDER_NAME,
                                                                                                         FIELD : @[FIELD_ONLINE, PHOTO_100]}]];
    
    AppDelegate *application = [[UIApplication sharedApplication] delegate];
    [application requestWithDataSource:[[VKCNetworkSource sharedInstance] getName] processor:[[VKCFriendsProcessor sharedInstance] getName] param:requestString callback:callback];
}


#pragma mark - Private methods

- (NSMutableString *)prepareRequestString:(NSMutableDictionary *)headersMap {
    NSMutableString *requestString = [[NSMutableString alloc] init];
    
    NSString *methodType = [headersMap valueForKey:METHOD_TYPE];
    NSString *dataType = [headersMap valueForKey:DATA_TYPE];
    if (!methodType || !dataType) {
        @throw [NSException exceptionWithName:@"Malformed request dictionary"
                                       reason:@"Undefined METHOD_TYPE or DATA_TYPE"
                                     userInfo:@{ @"What to do?" : @"Look through dictionary declaration attentively!"}];
    }
    [headersMap removeObjectsForKeys:@[METHOD_TYPE, DATA_TYPE]];
    
    [requestString appendFormat:METHOD_PATH, dataType, methodType];
    [headersMap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]]) {
            //multiple values for a key
            [requestString appendFormat:@"%@=", key];
            for (int i = 0; i < ((NSArray *)obj).count; i++) {
                [requestString appendFormat:@"%@,", obj[i]];
            }
            [requestString replaceCharactersInRange:NSMakeRange(requestString.length - 1, 1) withString:@"&"];
        } else {
            //single value for a key
            [requestString appendFormat:@"%@=%@&", key, obj];
        }
    }];
    [requestString appendFormat:@"v=%.2f&%@=%@", API_VERSION, ACCESS_TOKEN, self->credentials.token];
    
    return requestString;
}

@end
