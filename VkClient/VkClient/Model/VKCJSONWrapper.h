//
//  VKCJSONWrapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCJSONWrapper : NSObject {
    
    NSDictionary *json;
    
}

#pragma mark - Constants

extern NSString * const RESPONSE;
extern NSString * const ITEMS;


#pragma mark - Initializers

+ (id)objectWithJSON:(NSDictionary *)parsedJson;
+ (NSMutableArray *)arrayWithJSON:(NSDictionary *)jsonData;


#pragma mark - Accesors

- (NSString *)getString:(NSString *)key;
- (int)getInt:(NSString *)key;
- (float)getFloat:(NSString *)key;
- (BOOL)getBool:(NSString *)key;

@end
