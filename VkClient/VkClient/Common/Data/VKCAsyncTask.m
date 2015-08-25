//
//  VKCAsyncTask.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 25/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCAsyncTask.h"

@implementation VKCAsyncTask {
    @private
    id<VKCDataSource> dataSource;
    id<VKCProcessor> processor;
    id<VKCCallback> callback;
}

+ (VKCAsyncTask *)taskWithDataSource:(id<VKCDataSource>)aDataSource processor:(id<VKCProcessor>)aProcessor callback:(id<VKCCallback>)aCallback {
    VKCAsyncTask *task = [[VKCAsyncTask alloc] init];
    task->dataSource = aDataSource;
    task->processor = aProcessor;
    task->callback = aCallback;
    return task;
}

- (void)execute {
    
}

@end
