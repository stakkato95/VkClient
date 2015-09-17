//
//  VKCDataController.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 17/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "VKCAppDelegate.h"
#import "VKCSingleton.h"

@interface VKCDataController : NSObject <VKCSingleton>

- (void)initCoreDataStack;

- (void)commitChanges;

@end
