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

static NSString * const RESPONSE = @"response";
static NSString * const ITEMS = @"items";


#pragma mark - Initializers

- (VKCJSONWrapper *)initObjectWithJSON:(NSDictionary *)parsedJson {
    if (parsedJson) {
        json = parsedJson;
    }
    return self;
}

- (VKCJSONWrapper *)initArrayWithJSON:(NSData *)jsonData {
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

//- (float)getFloat:(NSString *)key {
//    return (float)[self->json objectForKey:key];
//}

- (BOOL)getBool:(NSString *)key {
    return (BOOL)[self->json objectForKey:key];
}

@end
