//
//  VKCManagedObjectMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 21/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "VKCMapper.h"

@interface VKCManagedObjectMapper : NSObject <VKCMapper>

+ (instancetype)managedObjectMapperWithEntityDescription:(NSEntityDescription *)entityDescription
                                                 context:(NSManagedObjectContext *)context
                                                 mapping:(NSDictionary *)jsonFieldsToPropertiesMapping;

@end
