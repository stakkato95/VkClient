//
//  VKCObjectMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCObjectMapper.h"

@implementation VKCObjectMapper {
    
    @private
    Class classOfEndObject;
    NSArray *mapperItems;
    
}

+ (instancetype)objectMapperForType:(Class)classOfEndObject
                        mapperItems:(NSArray *)mapperItems {
    VKCObjectMapper *objectMapper = [[VKCObjectMapper alloc] init];
    objectMapper->classOfEndObject = classOfEndObject;
    objectMapper->mapperItems = mapperItems;
    return objectMapper;
}


- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    id endObject = [[self->classOfEndObject alloc] init];
    
    for (VKCMapperItem *mapperItem in self->mapperItems) {
        id propertyName = mapperItem.propertyName;
        id<VKCMapper> propertyMapper = mapperItem.mapper;
        id propertyValue = [sourceObject valueForKey:mapperItem.jsonKey];
        
        if (propertyMapper) {
            propertyValue = [propertyMapper mapFromSourceObject:propertyValue error:error];
            
            if (error) {
                return nil;
            }
        }
        
        if (propertyValue) {
            [endObject setValue:propertyValue forKey:propertyName];
        }
    }
    
    return endObject;
}

@end
