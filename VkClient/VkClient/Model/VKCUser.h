//
//  VKCUser.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCIdentifiable.h"

@interface VKCUser : NSObject <VKCIdentifiable>

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSString *photo100;
@property (readonly) BOOL online;
//TODO: ADD PROPERTY FULLNAME

@end
