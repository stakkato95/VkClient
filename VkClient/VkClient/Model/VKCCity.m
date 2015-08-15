//
//  City.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCCity.h"

@implementation VKCCity

@synthesize identifier;

+ (VKCCity *) newWithName: (NSString *) aName {
    VKCCity *city = [[VKCCity alloc] init];
    city.name = aName;
    return city;
}

- (void)doAcion {
    unsigned long long int number = 99999999999;
    number++;
}

@end
