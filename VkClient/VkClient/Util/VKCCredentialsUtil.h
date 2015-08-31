//
//  VKCCredentialsUtil.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"
#import "VKCCredentials.h"
#import "NSString+StringAdditions.h"
#import "VKCApi.h"

@interface VKCCredentialsUtil : NSObject <VKCSingleton>

+ (instancetype)sharedInstance;
- (VKCCredentials *)parseCredentials:(NSString *)credentialsString;

@end
