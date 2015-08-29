//
//  VKCVKBatchMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 29/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"
#import "VKCArrayMapper.h"
#import "VKCVKArrayWrapMapper.h"
#import "VKCVKResponseMapper.h"

@interface VKCVKBatchMapper : NSObject <VKCMapper>

+ (instancetype)vkBatchMapperWithModelMapper:(id<VKCMapper>)modelMapper;

@end
