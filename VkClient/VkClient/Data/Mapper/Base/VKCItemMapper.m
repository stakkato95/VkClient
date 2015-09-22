//
//  VKCMapperItem.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCItemMapper.h"

@implementation VKCItemMapper

+ (instancetype)itemWithJSONKey:(NSString *)jsonKey
                   propertyName:(NSString *)propertyName
                         mapper:(id<VKCMapper>)mapper {
    VKCItemMapper *mapperItem = [[VKCItemMapper alloc] init];
    mapperItem.jsonKey = jsonKey;
    mapperItem.propertyName = propertyName;
    mapperItem.mapper = mapper;
    return mapperItem;
}

@end
