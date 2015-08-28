//
//  VKCJSONSerializationUtil.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCSingleton.h"

@interface VKCJSONSerializationUtil : NSObject <VKCSingleton>

- (NSDictionary *)serialize:(NSData *) jsonData error:(NSError *)error;

@end
