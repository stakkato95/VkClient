//
//  VKCVKArrayMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCVKArrayWrapMapper.h"

@implementation VKCVKArrayWrapMapper {
    
    @private
    id<VKCMapper> modelMapper;
    
}

+ (instancetype)vkArrayWrapMapperWithArrayMapper:(id<VKCMapper>)modelMapper {
    VKCVKArrayWrapMapper *arrayMapper = [[VKCVKArrayWrapMapper alloc] init];
    arrayMapper->modelMapper = modelMapper;
    return arrayMapper;
}

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    VKCObjectMapper *vkArrayMapper = [VKCObjectMapper objectMapperForType:[VKCVKArrayWrap class] mapperItems:@[[VKCItemMapper itemWithJSONKey:ITEMS propertyName:ITEMS mapper:self->modelMapper]]];
    return [vkArrayMapper mapFromSourceObject:sourceObject error:error];
}

@end
