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

#pragma mark - Main methods

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
                              (__bridge id)kSecAttrAccount : VK_COM,
                              (__bridge id)kSecAttrModificationDate : [NSNull null],
                              (__bridge id)(kSecReturnAttributes) : (__bridge id)(kCFBooleanTrue)
                              };
    return self;
}

- (void)retainToken:(NSString *)tokenString {
    int tokenDurationInSecons = [[tokenString vkc_trimStringBetween:EXPIRES_IN and:@"&"] intValue];
    tokenString = [tokenString vkc_trimStringBetween:@"=" and:@"&"];
    
    NSDate *currentDate = [NSDate date];
    NSDate *expirationDate = [[[NSDate alloc] init] initWithTimeIntervalSinceNow:tokenDurationInSecons];
    
    if (![self isTokenInKeychain:nil]) {
        NSDictionary *insertQuery = @{
                                      (__bridge id)(kSecClass) : (__bridge id)(kSecClassInternetPassword),
                                      (__bridge id)(kSecAttrAccessible) : (__bridge id)(kSecAttrAccessibleAfterFirstUnlock),
                                      (__bridge id)(kSecAttrCreationDate): currentDate,
                                      (__bridge id)(kSecAttrModificationDate): expirationDate,
                                      (__bridge id)(kSecAttrProtocol) : (__bridge id)(kSecAttrProtocolHTTPS),
                                      (__bridge id)(kSecAttrAuthenticationType) : (__bridge id)(kSecAttrAuthenticationTypeHTMLForm),
                                      (__bridge id)(kSecAttrPath) : OAUTH_PATH,
                                      (__bridge id)(kSecAttrAccount) : VK_COM,
                                      (__bridge id)(kSecValueData) : [tokenString dataUsingEncoding:NSUTF8StringEncoding]
                                      };
        
        OSStatus isTokenRetained = SecItemAdd((__bridge CFDictionaryRef)insertQuery, NULL);
        NSLog(@"isTokenRetained = %@", isTokenRetained == 0 ? @"YES" : @"NO");
    } else {
        NSDictionary *updateQuery = @{ (__bridge id)(kSecValueData) : [tokenString dataUsingEncoding:NSUTF8StringEncoding] };
        OSStatus isTokenUpdated = SecItemUpdate((__bridge CFDictionaryRef) self->attributesQuery, (__bridge CFDictionaryRef) updateQuery);
        NSLog(@"isTokenUpdated = %@", isTokenUpdated == 0 ? @"YES" : @"NO");
    }
}

- (NSString *)obtainToken {
    NSString *token = nil;
    CFMutableDictionaryRef tokenAttributes = nil;
    BOOL isTokenInKeychain = [self isTokenInKeychain:tokenAttributes];
    
    NSMutableDictionary *tokenQuery = [NSMutableDictionary dictionaryWithDictionary:(__bridge_transfer NSMutableDictionary *)tokenAttributes];
    NSDate *expirationDate = [tokenQuery valueForKey:(__bridge id)kSecAttrModificationDate];
    
    if (isTokenInKeychain && expirationDate && [[NSDate date] earlierDate:expirationDate]) {
        [tokenQuery removeObjectForKey:(__bridge id)(kSecReturnAttributes)];
        [tokenQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
        [tokenQuery setObject:(__bridge id)kSecClassInternetPassword forKey:(__bridge id)kSecClass];
        
        CFDataRef tokenDataPointer = nil;
        OSStatus isTokenObtained = SecItemCopyMatching((__bridge CFDictionaryRef)tokenQuery, (CFTypeRef *)&tokenDataPointer);
        if (isTokenObtained == errSecSuccess) {
            NSData *tokenData = (__bridge_transfer NSData *)tokenDataPointer;
            token = [[NSString alloc] initWithBytes:[tokenData bytes] length:[tokenData length] encoding:NSUTF8StringEncoding];
        }
    }
    
    return token;
}


#pragma mark - Help methods

- (BOOL)isTokenInKeychain:(CFMutableDictionaryRef)outputAttributes {
    return SecItemCopyMatching((__bridge CFDictionaryRef)(self->attributesQuery), (CFTypeRef *)&outputAttributes) == errSecSuccess;
}

@end
