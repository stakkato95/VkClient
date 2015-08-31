//
//  VKCJSONConstants.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCJSONConstants : NSObject

#pragma mark - Wrap

extern NSString * const RESPONSE;
extern NSString * const ITEMS;


#pragma mark - User

extern NSString * const ID;
extern NSString * const FIRST_NAME;
extern NSString * const LAST_NAME;
extern NSString * const ONLINE;
extern NSString * const PHOTO_100;

#pragma mark - Photo sizes

extern NSString * const PHOTO_100;


#pragma mark - Method types

extern NSString * const METHOD_TYPE;
extern NSString * const METHOD_GET;


#pragma mark - Data types

extern NSString * const DATA_TYPE;
extern NSString * const DATA_FRIENDS;


#pragma mark - Parameters Constants

extern NSString * const ORDER;
extern NSString * const ORDER_NAME;

extern NSString * const FIELD;
extern NSString * const FIELD_ONLINE;

@end
