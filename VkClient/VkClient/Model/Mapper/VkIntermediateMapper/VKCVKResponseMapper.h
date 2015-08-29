//
//  VKCVKArrayWrapperMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"
#import "VKCMapperItem.h"
#import "VKCVKResponse.h"
#import "VKCJSONConstants.h"
#import "VKCVKArrayWrapMapper.h"

@interface VKCVKResponseMapper : NSObject <VKCMapper>

+ (instancetype)vkResponseMapperWithVkArrayWrapMapper:(VKCVKArrayWrapMapper *)vkArrayMapper;

@end
