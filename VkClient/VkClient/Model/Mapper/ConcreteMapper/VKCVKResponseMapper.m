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
    VKCVKArrayWrapMapper *arrayMapper;
    
}

+ (instancetype)mapperWithVkArrayWrapMapper:(VKCVKArrayWrapMapper *)arrayMapper {
    VKCVKResponseMapper *wrapperMapper = [[VKCVKResponseMapper alloc] init];
    wrapperMapper->arrayMapper = arrayMapper;
    return wrapperMapper;
}

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    VKCObjectMapper *wrapMapper = [VKCObjectMapper objectMapperForType:[VKCVKResponse class] mapperItems:@[[VKCMapperItem itemWithJSONKey:RESPONSE propertyName:RESPONSE mapper:arrayMapper]]];
    return [wrapMapper mapFromSourceObject:sourceObject error:error];
}

@end
