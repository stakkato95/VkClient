//
//  VKCUser.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCJSONWrapper.h"

@interface VKCUser : VKCJSONWrapper

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) BOOL online;

@end
