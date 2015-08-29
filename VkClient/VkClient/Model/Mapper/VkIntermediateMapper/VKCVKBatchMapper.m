//
//  VKCVKBatchMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 29/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCVKBatchMapper.h"

@implementation VKCVKBatchMapper {
    
    @private
    id<VKCMapper> modelMapper;
    
}

+ (instancetype)vkBatchMapperWithModelMapper:(id<VKCMapper>)modelMapper {
    VKCVKBatchMapper *batchMapper = [[VKCVKBatchMapper alloc] init];
    batchMapper->modelMapper = modelMapper;
    return batchMapper;
}

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    VKCArrayMapper *usersArrayMapper = [VKCArrayMapper arrayMapperWithItemMapper:self->modelMapper];
    VKCVKArrayWrapMapper *vkArrayMapper = [VKCVKArrayWrapMapper vkArrayWrapMapperWithArrayMapper:usersArrayMapper];
    VKCVKResponseMapper *responseMapper = [VKCVKResponseMapper vkResponseMapperWithVkArrayWrapMapper:vkArrayMapper];
    return [responseMapper mapFromSourceObject:sourceObject error:error];
}

@end
