//
//  VKCVKArrayMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"
#import "VKCObjectMapper.h"
#import "VKCJSONConstants.h"
#import "VKCVKArrayWrap.h"
#import "VKCJSONSerializationUtil.h"

@interface VKCVKArrayWrapMapper : NSObject <VKCMapper>

+ (instancetype)arrayWrapMapperWithArrayMapper:(id<VKCMapper>)modelMapper;

@end
