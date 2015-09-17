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

- (BOOL)boolTest:(NSString *)string {
#warning unsafe place!!!
//# error FIX IT OR CODE WON'T COMPILE!
//    TODO: nee to be fixed!!!
//    FIXME: awful mus ne here
//    ???: WTF
//    !!!: LOOK HERE MAN=)
//    return string ? YES : NO;
    return string != nil; //better variant!!!
}

@end
