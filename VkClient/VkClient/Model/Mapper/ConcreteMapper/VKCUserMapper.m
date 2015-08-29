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
    VKCObjectMapper *userMapper = [VKCObjectMapper objectMapperForType:[VKCUser class] mapperItems:@[[VKCMapperItem itemWithJSONKey:ID propertyName: @"identifier" mapper:nil],
                                                                                                     [VKCMapperItem itemWithJSONKey:FIRST_NAME propertyName: @"firstName" mapper:nil],
                                                                                                     [VKCMapperItem itemWithJSONKey:LAST_NAME propertyName: @"lastName" mapper:nil],
                                                                                                     [VKCMapperItem itemWithJSONKey:ONLINE propertyName: @"online" mapper:nil]]];
    VKCVKBatchMapper *batchMapper = [VKCVKBatchMapper vkBatchMapperWithModelMapper:userMapper];
    return [batchMapper mapFromSourceObject:sourceObject error:error];
}

@end
