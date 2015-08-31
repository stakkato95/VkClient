//
//  UIImageView+ImageLoader.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 30/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageLoader) //<NSURLSessionTaskDelegate>

#pragma mark - Cache constants

extern int const Mbyte;
extern int const URL_CACHE_MEMORY_CAPACITY;
extern int const URL_CACHE_DISK_CAPACITY;
extern NSString * const URL_CACHE_DISK_PATH;

#pragma mark - ImageLoader methods

- (void)displayImageWithURL:(NSString *)imageURL;

@end
