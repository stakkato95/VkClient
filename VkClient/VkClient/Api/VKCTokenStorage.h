//
//  VKCToken.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 20/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCTokenStorage : NSObject {
    @private
    NSDictionary *attributesQuery;
}

+ (VKCTokenStorage *)sharedInstance;
- (void)retain:(NSString *)tokenString;
- (NSString *)obtain;

@end
