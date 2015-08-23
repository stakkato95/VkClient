//
//  VKCToken.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 20/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"

@interface VKCTokenStorage : NSObject <VKCSingleton> {
    @private
    NSDictionary *attributesQuery;
}

+ (VKCTokenStorage *)sharedInstance;
- (void)retainToken:(NSString *)tokenString;
- (NSString *)obtainToken;

@end
