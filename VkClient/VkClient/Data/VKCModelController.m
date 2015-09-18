//
//  VKCModelController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 18/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCModelController.h"


@implementation VKCModelController

static NSString * const USER_ENTITY = @"User";
static NSEntityDescription *userEntityDescription;

+ (instancetype)sharedInstance {
    static VKCModelController *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{
        instance = [[VKCModelController alloc] init];
        [instance initEntities];
    });
    return instance;
}

- (void)saveUsers:(NSArray *)usersArray {
    for (VKCUser* user in usersArray) {
        NSManagedObject *userManagedObject = [[NSManagedObject alloc] initWithEntity:userEntityDescription insertIntoManagedObjectContext:[VKCCoreDataController sharedInstance].context];
        [userManagedObject setValue:user.firstName forKey:@"firstName"];
        [userManagedObject setValue:user.lastName forKey:@"lastName"];        
        [userManagedObject setValue:user.status forKey:@"status"];
        [userManagedObject setValue:user.photo100 forKey:@"photo100"];
    }
    [[VKCCoreDataController sharedInstance] commitChanges];
}

#pragma mark - Helper methods

- (void)initEntities {
    userEntityDescription = [NSEntityDescription entityForName:USER_ENTITY inManagedObjectContext:[VKCCoreDataController sharedInstance].context];
}

@end
