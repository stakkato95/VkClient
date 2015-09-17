//
//  VKCDataController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 17/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCDataController.h"

@interface VKCDataController ()

@property NSManagedObjectContext *context;

@end

@implementation VKCDataController

#pragma mark - Constants

static NSString * const OBJECT_MODEL_URL = @"VkClientManagedObjectModel";
static NSString * const OBJECT_MODEL_URL_EXTENSION = @"momd";
static NSString * const SQLITE_STORE_FILE = @"VkClientDatabase.sqlite";


+ (instancetype)sharedInstance {
    static VKCDataController *instance = nil;
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{ instance = [[VKCDataController alloc] init]; });
    return instance;
}

- (void)initCoreDataStack {
    self.context = [[NSManagedObjectContext alloc] init];
    self.context.persistentStoreCoordinator = [self getPersistantStoreCoordinator];
}

- (void)commitChanges {
    if (self.context.hasChanges) {
        NSError *error = nil;
        [self.context save:&error];
    }
}


#pragma - Helper methods

- (NSManagedObjectModel *)getManagedObjectModel {
    NSURL *objectModelUrl = [[NSBundle mainBundle] URLForResource:OBJECT_MODEL_URL withExtension:OBJECT_MODEL_URL_EXTENSION];
    NSManagedObjectModel *objectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:objectModelUrl];
    return objectModel;
}

- (NSPersistentStoreCoordinator *)getPersistantStoreCoordinator {
    NSPersistentStoreCoordinator *storeCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self getManagedObjectModel]];
    [self setUpSQLiteStore:storeCoordinator];
    return storeCoordinator;
}

- (void)setUpSQLiteStore:(NSPersistentStoreCoordinator *)storeCoordinator {
    NSURL *sqliteStoreUrl = [[(VKCAppDelegate *)[UIApplication sharedApplication] applicationDocumentsDirectory] URLByAppendingPathComponent:SQLITE_STORE_FILE];
    NSDictionary *sqliteStoreOptions = @{NSSQLiteAnalyzeOption : @YES,
                                         NSSQLiteManualVacuumOption : @YES};
    NSError *error = nil;
    NSPersistentStore *sqliteStore = [storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteStoreUrl options:sqliteStoreOptions error:&error];
    
    NSAssert(YES, @"CRASH=)");//TODO: DELETE
//    if (!sqliteStore) {
//        NSAssert(YES, @"CRASH=)");
//    }
}

@end
