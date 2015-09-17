//
//  AppDelegate.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 13/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCAppDelegate.h"

@interface VKCAppDelegate ()

- (void)throwExceptionForPlugin:(NSString *)pluginName;

- (void)registerPlugin:(id<VKCPlugin>)plugin;

@end

@implementation VKCAppDelegate {

    NSMutableDictionary *plugins;
    
}

#pragma mark - Default methods

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setUpPlugins];
    [self setUpImageLoaderCache];
    [[VKCDataController sharedInstance] initCoreDataStack];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[VKCDataController sharedInstance] commitChanges];
}


#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.stakkato.VkClient" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark - Helper methods

- (void)setUpImageLoaderCache {
    [NSURLCache setSharedURLCache:[[NSURLCache alloc] initWithMemoryCapacity:URL_CACHE_MEMORY_CAPACITY
                                                                diskCapacity:URL_CACHE_DISK_CAPACITY
                                                                    diskPath:URL_CACHE_DISK_PATH]];
}

- (void)setUpPlugins {
    self->plugins = [[NSMutableDictionary alloc] init];
    [self registerPlugin:[VKCNetworkSource sharedInstance]];
    [self registerPlugin:[VKCFriendsProcessor sharedInstance]];
}


#pragma mark - Custom methods PUBLIC

- (void)requestWithDataSource:(NSString *)sourceName
                    processor:(NSString *)processorName
                        param:(id)param
                     callback:(id<VKCCallback>)callback {
    id<VKCDataSource> dataSource = [self->plugins objectForKey:sourceName];
    id<VKCProcessor> processor = [self->plugins objectForKey:processorName];
    
    if (!dataSource) {
        [self throwExceptionForPlugin:sourceName];
    }
    if (!processor) {
        [self throwExceptionForPlugin:processorName];
    }
    
    [[VKCAsyncTask taskWithDataSource:dataSource processor:processor param:param callback:callback] execute];
}


#pragma mark - Custom methods PRIVATE

- (void)registerPlugin:(id<VKCPlugin>)plugin {
    [self->plugins setObject:plugin forKey:[plugin getName]];
}

- (void)throwExceptionForPlugin:(NSString *)pluginName {
    @throw [NSException exceptionWithName:@"Unknown plugin exception"
                                   reason:[NSString stringWithFormat:@"Plugin with name %@", pluginName]
                                 userInfo:@{ @"What to do?" : @"Register plugin with this name!"}];
}

@end
