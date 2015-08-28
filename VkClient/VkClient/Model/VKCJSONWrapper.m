//
//  VKCJSONWrapper.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCJSONWrapper.h"

@implementation VKCJSONWrapper

#pragma mark - Constants




#pragma mark - Initializers

+ (id)objectWithJSON:(NSDictionary *)parsedJson {
    VKCJSONWrapper *wrapper = [[VKCJSONWrapper alloc] init];
    if (parsedJson) {
        wrapper->json = parsedJson;
    }
    return wrapper;
}

+ (VKCJSONWrapper *)arrayWithJSON:(NSDictionary *)jsonData {
//    method should be overriden in particular class
    return nil;
}


#pragma mark - Accesors

- (NSString *)getString:(NSString *)key {
    return [self->json objectForKey:key];
}

- (int)getInt:(NSString *)key {
    return (int)[self->json objectForKey:key];
}

- (float)getFloat:(NSString *)key {
    return [(NSNumber *)[self->json objectForKey:key] floatValue];
}

- (BOOL)getBool:(NSString *)key {
    return (BOOL)[self->json objectForKey:key];
}

@end
