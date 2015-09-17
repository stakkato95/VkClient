//
//  VKCMapperItem.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"

@interface VKCMapperItem : NSObject

@property NSString *jsonKey;
@property NSString *propertyName;
@property id<VKCMapper> mapper;

+ (instancetype)itemWithJSONKey:(NSString *)jsonKey
                   propertyName:(NSString *)propertyName
                         mapper:(id<VKCMapper>)mapper;

@end
