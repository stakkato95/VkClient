//
//  VKCDataSource.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 23/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCPlugin.h"

@protocol VKCDataSource <NSObject, VKCPlugin>

- (id)getData:(id)parameter;

@end
