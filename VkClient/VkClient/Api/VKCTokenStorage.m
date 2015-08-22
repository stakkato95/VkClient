//
//  VKCToken.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 20/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Security/Security.h>
#import "VKCTokenStorage.h"
#import "NSStringAdditions.h"
#import "VKCApi.h"

@implementation VKCTokenStorage

+ (VKCTokenStorage *)sharedInstance {
    static VKCTokenStorage *storage = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ storage = [[VKCTokenStorage alloc] init]; });
    return storage;
}

- (VKCTokenStorage *)init {
    self = [super init];
    self->attributesQuery = @{
                         (__bridge id)(kSecClass) : (__bridge id)(kSecClassInternetPassword),
                         (__bridge id)(kSecAttrAccessible) : (__bridge id)(kSecAttrAccessibleAfterFirstUnlock),
                         (__bridge id)(kSecAttrProtocol) : (__bridge id)(kSecAttrProtocolHTTPS),
                         (__bridge id)(kSecAttrAuthenticationType) : (__bridge id)(kSecAttrAuthenticationTypeHTMLForm),
                         (__bridge id)(kSecAttrPath) : OAUTH_PATH,
                         (__bridge id)(kSecAttrAccount) : VK_COM,
                         (__bridge id)(kSecReturnAttributes) : (__bridge id)(kCFBooleanTrue)
                         };
    return self;
    
}

- (void)retain:(NSString *)tokenString {
    tokenString = [tokenString vkc_trimStringBetween:@"=" and:@"&"];
    NSMutableDictionary *dataInsertion = [NSMutableDictionary dictionaryWithDictionary: @{
                                                                                          (__bridge id)(kSecClass) : (__bridge id)(kSecClassInternetPassword),
                                                                                          (__bridge id)(kSecAttrAccessible) : (__bridge id)(kSecAttrAccessibleAfterFirstUnlock),
                                                                                          (__bridge id)(kSecAttrCreationDate): (__bridge_transfer id)(CFDateCreate(NULL, CFAbsoluteTimeGetCurrent())),
                                                                                          (__bridge id)(kSecAttrProtocol) : (__bridge id)(kSecAttrProtocolHTTPS),
                                                                                          (__bridge id)(kSecAttrAuthenticationType) : (__bridge id)(kSecAttrAuthenticationTypeHTMLForm),
                                                                                          (__bridge id)(kSecAttrPath) : OAUTH_PATH,
                                                                                          (__bridge id)(kSecAttrAccount) : VK_COM,
                                                                                          (__bridge id)(kSecValueData) : [tokenString dataUsingEncoding:NSUTF8StringEncoding]
                                                                                          
                                                                                          }];
    
    OSStatus isTokenRetained = SecItemAdd((__bridge CFDictionaryRef) dataInsertion, NULL);
    NSLog(@"isTokenRetained = %@", isTokenRetained == 0 ? @"YES" : @"NO");
}

- (NSString *)obtain {
    NSString *password = nil;
    CFMutableDictionaryRef tokenAttributes = nil;
    OSStatus isTokenInKeychain = SecItemCopyMatching((__bridge CFDictionaryRef)(self->attributesQuery), (CFTypeRef *)&tokenAttributes);
    
    if (isTokenInKeychain == errSecSuccess) {
        NSMutableDictionary *tokenQuery = [NSMutableDictionary dictionaryWithDictionary:(__bridge_transfer NSMutableDictionary *)tokenAttributes];
        [tokenQuery removeObjectForKey:(__bridge id)(kSecReturnAttributes)];
        [tokenQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
        [tokenQuery setObject:(__bridge id)kSecClassInternetPassword forKey:(__bridge id)kSecClass];
        
        CFDataRef tokenDataPointer = nil;
        OSStatus isTokenObtained = SecItemCopyMatching((__bridge CFDictionaryRef)tokenQuery, (CFTypeRef *)&tokenDataPointer);
        if (isTokenObtained == errSecSuccess) {
            NSData *tokenData = (__bridge_transfer NSData *)tokenDataPointer;
            password = [[NSString alloc] initWithBytes:[tokenData bytes] length:[tokenData length] encoding:NSUTF8StringEncoding];
        }
    }
    
    return password;
}

@end
