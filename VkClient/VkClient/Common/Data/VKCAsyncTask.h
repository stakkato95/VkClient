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

+ (instancetype)taskWithDataSource:(id<VKCDataSource>)aDataSource
                         processor:(id<VKCProcessor>)aProcessor
                             param:(id)aParam
                          callback:(id<VKCCallback>)aCallback;

- (void)execute;

@end
