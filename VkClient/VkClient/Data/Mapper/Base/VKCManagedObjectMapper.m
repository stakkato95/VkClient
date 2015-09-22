//
//  VKCManagedObjectMapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 21/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCManagedObjectMapper.h"

@interface VKCManagedObjectMapper ()

@property NSEntityDescription *entityDescription;
@property NSDictionary *jsonFieldsToPropertiesMapping;
@property NSManagedObjectContext *context;

@end

@implementation VKCManagedObjectMapper

+ (instancetype)managedObjectMapperWithEntityDescription:(NSEntityDescription *)entityDescription
                                                 context:(NSManagedObjectContext *)context
                                                 mapping:(NSDictionary *)jsonFieldsToPropertiesMapping {
    VKCManagedObjectMapper *mapper = [[VKCManagedObjectMapper alloc] init];
    mapper.entityDescription = entityDescription;
    mapper.context = context;
    mapper.jsonFieldsToPropertiesMapping = jsonFieldsToPropertiesMapping;
    return mapper;
}

- (id)mapFromSourceObject:(NSDictionary *)jsonObject error:(NSError *)error {
    NSManagedObject *object = [[NSManagedObject alloc] initWithEntity:self.entityDescription insertIntoManagedObjectContext:self.context];
    
    [self.jsonFieldsToPropertiesMapping enumerateKeysAndObjectsUsingBlock:^(id jsonField, id property, BOOL *stop) {
        [object setValue:[jsonObject objectForKey:jsonField] forKey:property];
    }];
    
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    //TODO: the next file to be modified is VKCObjectMapper
    
    return nil;
}

@end
