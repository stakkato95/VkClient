//
//  VKCMapperItem.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCMapperItem.h"

@implementation VKCMapperItem

+ (instancetype)itemWithJSONKey:(NSString *)jsonKey
                   propertyName:(NSString *)propertyName
                         mapper:(id<VKCMapper>)mapper {
    VKCMapperItem *mapperItem = [[VKCMapperItem alloc] init];
    mapperItem.jsonKey = jsonKey;
    mapperItem.propertyName = propertyName;
    mapperItem.mapper = mapper;
    return mapperItem;
}

@end
