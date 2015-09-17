//
//  City.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCIdentifiable.h"

@interface VKCCity : NSObject <VKCIdentifiable>

@property (readwrite) NSString *name;

+ (VKCCity *) newWithName: (NSString *) aName;

- (void) doAcion;

@end
