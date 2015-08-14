//
//  City.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCCity : NSObject

@property (readwrite) NSString *name;

+ (VKCCity *) newWithName: (NSString *) aName;

@end
