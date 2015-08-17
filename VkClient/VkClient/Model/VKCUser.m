//
//  User.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCUser.h"
#import "VKCAPI.h"

@interface VKCUser()

@property (readwrite) Name *property;
//EXTENSION!!! place for PRIVATE methods and properties (or readjust property to be INTERNALLY READWRITE)
@property NSString *privateProperty;

@end


@implementation VKCUser

static NSString *const CONSTANT = @"string";

@synthesize identifier;

+ (VKCUser *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName birthDate:(NSDate *)aBirthDate status:(NSString *)aStatus online:(BOOL)aOnline {
    VKCUser *user = [[VKCUser alloc] init];
    user.firstName = aFirstName;
    user.secondName = aSecondName;
    user.birthDate = aBirthDate;
    user.status = aStatus;
    user.online = aOnline;
    user->publicVar = @"5";
    user.property = @"";
    
    return user;
}

+ (VKCUser *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName {
    return [VKCUser userWithFirstName:aFirstName secondName:aSecondName birthDate:nil status:nil online:NO];
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
