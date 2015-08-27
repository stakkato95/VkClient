//
//  VKCObjectMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCObjectMapper.h"

@implementation VKCObjectMapper

+ (instancetype)objectMapperForType:(Class)classOfEndObject
             jsonKeysToObjectFields:(NSDictionary *)keysToFields
              objectFieldsToMappers:(NSDictionary *)fieldsToMappers {
    VKCObjectMapper *objectMapper = [super init];
    objectMapper->classOfEndObject = classOfEndObject;
    objectMapper->keysToFields = keysToFields;
    objectMapper->fieldsToMappers = fieldsToMappers;
    return objectMapper;
}


- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error {
    id endObject = [[self->classOfEndObject alloc] init];
    __block BOOL didErrorOccur;
    
    for (id key in self->keysToFields) {
        id fieldName = [self->keysToFields valueForKey:key];
        id<VKCMapper> fieldMapper = [self->fieldsToMappers valueForKey:fieldName];
        id fieldValue = [sourceObject valueForKey:key];
        
        if (fieldMapper) {
            fieldValue = [fieldMapper mapFromSourceObject:fieldValue error:error];
            
            if (error) {
                return nil;
            }
        }
        
        if (fieldValue) {
            [endObject setValue:fieldValue forKey:fieldName];
        }
    }
    
    return didErrorOccur ? nil : endObject;
}

@end
