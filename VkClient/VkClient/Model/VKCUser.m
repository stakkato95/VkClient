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

//EXTENSION!!! place for private methods and properties

@end


@implementation VKCUser {
    //place for instance variables NOT PROPERTIES!!!
}

static NSString *const CONSTANT = @"string";

+ (VKCUser *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName birthDate:(NSDate *)aBirthDate status:(NSString *)aStatus online:(BOOL)aOnline {
    VKCUser *user = [[VKCUser alloc] init];
    user.firstName = aFirstName;
    user.secondName = aSecondName;
    user.birthDate = aBirthDate;
    user.status = aStatus;
    user.online = aOnline;
    
    return user;
}

+ (VKCUser *)userWithFirstName:(NSString *)aFirstName secondName:(NSString *)aSecondName {
    return [VKCUser userWithFirstName:aFirstName secondName:aSecondName birthDate:nil status:nil online:NO];
}

@end
