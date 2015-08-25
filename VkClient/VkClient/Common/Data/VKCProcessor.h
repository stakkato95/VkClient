//
//  VKCProcessor.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>
#import "VKCPlugin.h"

@protocol VKCProcessor <NSObject, VKCPlugin>

- (id)process:(id)parameter;

@end
