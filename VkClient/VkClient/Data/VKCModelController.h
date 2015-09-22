//
//  VKCModelController.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 18/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCCoreDataController.h"
#import "VKCSingleton.h"
#import "VKCUser.h"

@interface VKCModelController : NSObject <VKCSingleton>

@property NSEntityDescription *userEntityDescription;
@property NSEntityDescription *messageEntityDescription;

- (void)saveUsers:(NSArray *)usersArray;

@end
