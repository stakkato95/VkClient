//
//  AppDelegate.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 13/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "VKCPlugin.h"
#import "VKCDataSource.h"
#import "VKCProcessor.h"
#import "VKCAsyncTask.h"
#import "VKCCallback.h"
#import "VKCNetworkSource.h"
#import "VKCFriendsProcessor.h"
#import "UIImageView+ImageLoader.h"
#import "VKCDataController.h"

@interface VKCAppDelegate : UIResponder <UIApplicationDelegate>

#pragma mark - Default properties & methods

@property (strong, nonatomic) UIWindow *window;

- (NSURL *)applicationDocumentsDirectory;


#pragma mark - Custom properties & methods

- (void)requestWithDataSource:(NSString *)sourceName
                    processor:(NSString *)processorName
                        param:(id)param
                     callback:(id<VKCCallback>)callback;


@end

