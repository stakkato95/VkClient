//
//  User.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCPolygon.h"
#import "VKCAPI.h"

@interface VKCPolygon()

@property (readwrite) Name *property;
//EXTENSION!!! place for PRIVATE methods and properties (or readjust property to be INTERNALLY READWRITE)
@property NSString *privateProperty;

@end


@implementation VKCPolygon

static NSString *const CONSTANT = @"string";

@synthesize identifier;

+ (VKCPolygon *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName birthDate:(NSDate *)aBirthDate status:(NSString *)aStatus online:(BOOL)aOnline {
    VKCPolygon *user = [[VKCPolygon alloc] init];
    user.firstName = aFirstName;
    user.secondName = aSecondName;
    user.birthDate = aBirthDate;
    user.status = aStatus;
    user.online = aOnline;
    user->publicVar = @"5";
    user.property = @"";
    
    return user;
}

+ (VKCPolygon *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName {
    return [VKCPolygon userWithFirstName:aFirstName secondName:aSecondName birthDate:nil status:nil online:NO];
}

- (void)checkStringRange {
    NSString *str = @"Hello my big world";
    NSRange range = [str rangeOfString:@"big"];
    NSValue *value = [NSValue valueWithRange:range];
}

//FUN WITH BLOCKS
- (void)someMethodWithIntParam: (int) one floatParam: (float) two nsNumberParam: (NSNumber *) three block: (void (^)(int, float, NSNumber *)) callbackWithParameters {
    callbackWithParameters(one, two, three);
}

- (void)performBlockCallback: (Callback) callback {
    callback();
}

@end
