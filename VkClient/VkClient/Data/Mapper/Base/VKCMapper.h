//
//  VKCMapper.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 27/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKCMapper <NSObject>

- (id)mapFromSourceObject:(id)sourceObject error:(NSError *)error;

@end
