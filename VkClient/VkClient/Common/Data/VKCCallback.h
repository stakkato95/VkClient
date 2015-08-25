//
//  VKCCallback.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 25/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKCCallback <NSObject>

- (void)loadingStart;
- (void)loadingFinished:(id)data;
- (void)loadingError:(id)error;

@end
