//
//  VKCVKArrayWrapperMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCVKResponseMapper.h"

@implementation VKCVKResponseMapper {
    
    @private
    VKCVKArrayWrapMapper *vkArrayWrapMapper;
    
}

+ (instancetype)vkResponseMapperWithVkArrayWrapMapper:(VKCVKArrayWrapMapper *)vkArrayWrapMapper {
    VKCVKResponseMapper *wrapperMapper = [[VKCVKResponseMapper alloc] init];
    wrapperMapper->vkArrayWrapMapper = vkArrayWrapMapper;
    return wrapperMapper;
}

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    VKCObjectMapper *wrapMapper = [VKCObjectMapper objectMapperForType:[VKCVKResponse class] mapperItems:@[[VKCItemMapper itemWithJSONKey:RESPONSE propertyName:RESPONSE mapper:self->vkArrayWrapMapper]]];
    return [wrapMapper mapFromSourceObject:sourceObject error:error];
}

@end
