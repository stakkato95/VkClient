//
//  VKCObjectMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"
#import "VKCMapperItem.h"

@interface VKCObjectMapper : NSObject <VKCMapper>

+ (instancetype)objectMapperForType:(Class)classOfEndObject
                       mapperItems:(NSArray *)mapperItems;


@end
