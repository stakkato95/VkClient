//
//  User.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 14/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCIdentifiable.h"
#import "VKCBlocks.h"

//NEW TYPE CALLED Name
typedef NSString Name;

@interface VKCUser : NSObject <VKCIdentifiable> {
    //place for instance variables NOT PROPERTIES!!!
}

@property NSString *firstName;
@property NSString *secondName;
@property NSDate *birthDate;
@property NSString *status;
@property (getter=isOnline) BOOL online; //BOOL without pointer as it's primitive type!!!

@property (readonly) Name *property; //property that is READONLY for outer objects & READWRITE for inner use. See .m file extension!!!!!

+ (VKCUser *)userWithFirstName: (NSString *) aFirstName secondName: (NSString *) aSecondName birthDate: (NSDate *) aBirthDate status: (NSString *) aStatus online: (BOOL) aOnline;
+ (VKCUser *)userWithFirstName: (NSString *) aFirstName secondName: (NSString *) aSecondName;

- (void)checkStringRange;
//FUN WITH BLOCKS
- (void)someMethodWithIntParam: (int) one floatParam: (float) two nsNumberParam: (NSNumber *) three block: (void (^)(int, float, NSNumber *)) callbackWithParameters;
- (void)performBlockCallback: (Callback) callbackCCCCCC;

@end
