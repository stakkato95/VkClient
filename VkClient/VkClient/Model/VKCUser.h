//
//  User.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCUser : NSObject {
    //place for instance variables NOT PROPERTIES!!!
}

@property NSString *firstName;
@property NSString *secondName;
@property NSDate *birthDate;
@property NSString *status;
@property (getter=isOnline) BOOL online; //BOOL without pointer as it's primitive type!!!

+ (VKCUser *)userWithFirstName: (NSString *) aFirstName secondName: (NSString *) aSecondName birthDate: (NSDate *) aBirthDate status: (NSString *) aStatus online: (BOOL) aOnline;
+ (VKCUser *)userWithFirstName: (NSString *) aFirstName secondName: (NSString *) aSecondName;

@end
