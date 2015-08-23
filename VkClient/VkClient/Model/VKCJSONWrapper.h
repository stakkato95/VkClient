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

#pragma mark - Initializers

- (VKCJSONWrapper *)initObjectWithJSON:(NSDictionary *)parsedJson;
- (VKCJSONWrapper *)initArrayWithJSON:(NSData *)jsonData;


#pragma mark - Accesors

- (NSString *)getString:(NSString *)key;
- (int)getInt:(NSString *)key;
- (float)getFloat:(NSString *)key;
- (BOOL)getBool:(NSString *)key;

@end
