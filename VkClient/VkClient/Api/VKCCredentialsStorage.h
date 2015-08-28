//
//  VKCToken.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 20/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"
#import "VKCCredentials.h"

@interface VKCCredentialsStorage : NSObject <VKCSingleton>

- (void)retainCredentials:(VKCCredentials *)credentials;
- (VKCCredentials *)obtainCredentials;

@end
