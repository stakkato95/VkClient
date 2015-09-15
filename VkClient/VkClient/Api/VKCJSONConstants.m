//
//  VKCJSONConstants.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 28/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCJSONConstants.h"

@implementation VKCJSONConstants

#pragma mark - Wrap

NSString * const RESPONSE = @"response";
NSString * const ITEMS = @"items";


#pragma mark - User

NSString * const ID = @"id";
NSString * const FIRST_NAME = @"first_name";
NSString * const LAST_NAME = @"last_name";//TODO: THE SAME
NSString * const ONLINE = @"online";

#pragma mark - Photo sizes

NSString * const PHOTO_100 = @"photo_100";


#pragma mark - Method types

NSString * const METHOD_TYPE = @"method_type";
NSString * const METHOD_GET = @"get";


#pragma mark - Data types

NSString * const DATA_TYPE = @"data_type";
NSString * const DATA_FRIENDS = @"friends";


#pragma mark - Parameters Constants

NSString * const ORDER = @"order";
NSString * const ORDER_NAME = @"name";

NSString * const FIELD = @"fields";
NSString * const FIELD_ONLINE = @"online"; //TODO: THE SAME
NSString * const FIELD_STATUS = @"status";

@end
