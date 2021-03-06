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
    VKCObjectMapper *userMapper = [VKCObjectMapper objectMapperForType:[VKCUser class] mapperItems:@[[VKCItemMapper itemWithJSONKey:ID propertyName: @"identifier" mapper:nil],
                                                                                                     [VKCItemMapper itemWithJSONKey:FIRST_NAME propertyName: @"firstName" mapper:nil],
                                                                                                     [VKCItemMapper itemWithJSONKey:LAST_NAME propertyName: @"lastName" mapper:nil],
                                                                                                     [VKCItemMapper itemWithJSONKey:FIELD_STATUS propertyName: @"status" mapper:nil],
                                                                                                     [VKCItemMapper itemWithJSONKey:ONLINE propertyName: @"online" mapper:nil],
                                                                                                     [VKCItemMapper itemWithJSONKey:PHOTO_100 propertyName: @"photo100" mapper:nil]]];
    VKCVKBatchMapper *batchMapper = [VKCVKBatchMapper vkBatchMapperWithModelMapper:userMapper];
    return [batchMapper mapFromSourceObject:sourceObject error:error];
}

@end
