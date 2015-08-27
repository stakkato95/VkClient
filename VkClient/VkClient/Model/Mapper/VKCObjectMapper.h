//
//  VKCObjectMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCMapper.h"

@interface VKCObjectMapper : NSObject <VKCMapper> {
    
    @private
    Class classOfEndObject;
    NSDictionary *keysToFields;
    NSDictionary *fieldsToMappers;
    
}

+ (instancetype)objectMapperForType:(Class)classOfEndObject
                  jsonKeysToObjectFields:(NSDictionary *)keysToFields
                   objectFieldsToMappers:(NSDictionary *)fieldsToMappers;


@end
