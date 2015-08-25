//
//  VKCAsyncTask.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 25/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCDataSource.h"
#import "VKCProcessor.h"
#import "VKCCallback.h"

@interface VKCAsyncTask : NSObject

+ (VKCAsyncTask *)taskWithDataSource:(id<VKCDataSource>)dataSource processor:(id<VKCProcessor>)processor callback:(id<VKCCallback>)callback;
- (void)execute;

@end
