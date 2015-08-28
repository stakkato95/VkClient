//
//  VKCArrayMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCArrayMapper.h"

@implementation VKCArrayMapper {

    @private
    id<VKCMapper> objectMapper;
    
}

+ (instancetype)arrayMapperWithItemMapper:(VKCObjectMapper *)objectMapper {
    VKCArrayMapper *arrayMapper = [[VKCArrayMapper alloc] init];
    arrayMapper->objectMapper = objectMapper;
    return arrayMapper;
}

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    NSMutableArray *arrayOfEndObjects = [[NSMutableArray alloc] init];
    
    for (id arrayItem in sourceObject) {
        id endObject = [self->objectMapper mapFromSourceObject:arrayItem error:error];
        if (error) {
            return nil;
        }
        if (endObject) {
            [arrayOfEndObjects addObject:endObject];
        }
    }
    
    return arrayOfEndObjects;
}

@end
