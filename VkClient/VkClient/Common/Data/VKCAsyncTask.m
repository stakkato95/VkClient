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
    id param;
    id<VKCDataSource> dataSource;
    id<VKCProcessor> processor;
    id<VKCCallback> callback;
}

+ (VKCAsyncTask *)taskWithParam:(id)aParam dataSource:(id<VKCDataSource>)aDataSource processor:(id<VKCProcessor>)aProcessor callback:(id<VKCCallback>)aCallback {
    VKCAsyncTask *task = [[VKCAsyncTask alloc] init];
    task->param = aParam;
    task->dataSource = aDataSource;
    task->processor = aProcessor;
    task->callback = aCallback;
    return task;
}

- (void)execute {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        //        TODO: TRY TO THROW EXCEPTION
        @try {
            dispatch_sync(mainQueue, ^{
                [callback loadingStart];
            });
            id data = [self->dataSource getData:self->param];
            id result = [self->processor process:data];
            dispatch_sync(mainQueue, ^{
                [callback loadingFinished:result];
            });
        }
        @catch (NSException *exception) {
            dispatch_sync(mainQueue, ^{
                [callback loadingError:exception];
            });
        }
    });
}

@end
