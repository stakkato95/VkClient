//
//  VKCUserMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCUserMapper.h"

@implementation VKCUserMapper

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    VKCNumberMapper *numberMapper = [[VKCNumberMapper alloc] init];
    VKCBoolMapper *boolMapper = [[VKCBoolMapper alloc] init];
    VKCObjectMapper *userMapper = [VKCObjectMapper objectMapperForType:[VKCUser class] mapperItems:@[ [VKCMapperItem itemWithJSONKey:ID propertyName: @"identifier" mapper:numberMapper],
                                                                                                      [VKCMapperItem itemWithJSONKey:FIRST_NAME propertyName: @"firstName" mapper:numberMapper],
                                                                                                      [VKCMapperItem itemWithJSONKey:LAST_NAME propertyName: @"lastName" mapper:numberMapper],
                                                                                                      [VKCMapperItem itemWithJSONKey:ONLINE propertyName: @"online" mapper:boolMapper]]];
    VKCArrayMapper *usersArrayMapper = [VKCArrayMapper arrayMapperWithItemMapper:userMapper];
    VKCVKArrayWrapMapper *vkArrayMapper = [VKCVKArrayWrapMapper arrayWrapMapperWithArrayMapper:usersArrayMapper];
    VKCVKResponseMapper *wrapperMapper = [VKCVKResponseMapper mapperWithVkArrayWrapMapper:vkArrayMapper];

    return [wrapperMapper mapFromSourceObject:sourceObject error:error];
}

@end
