//
//  VKCToken.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 20/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

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

- (void)retain:(NSString *) tokenString {
    [NSString vkc_trimString:tokenString betweenString:@"=" andString:@"&"];
    NSDictionary *insert2 = [NSDictionary dictionaryWithObjectsAndKeys:
                             (__bridge id)(kSecClass) , kSecClassInternetPassword,
                             kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlock,
                             kSecAttrCreationDate, CFDateCreate(NULL, CFAbsoluteTimeGetCurrent()),
                             kSecAttrProtocol, kSecAttrProtocolHTTPS,
                             kSecAttrAuthenticationType, kSecAttrAuthenticationTypeHTMLForm,
                             kSecAttrPath, (CFStringRef) OAUTH_PATH,
                             kSecAttrAccount, (CFStringRef)VK_COM,
                             nil];
    
    
    //TODO: PASS TOKEN TO THE DICTIONARY!!!
}

- (NSString *)obtain {
    return nil;
}

@end
