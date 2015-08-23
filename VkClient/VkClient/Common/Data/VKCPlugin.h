//
//  VKCPlugin.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"

@protocol VKCPlugin <NSObject, VKCSingleton>

- (NSString *)getName;

@end
