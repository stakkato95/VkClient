//
//  UIImageView+ImageLoader.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 30/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "UIImageView+ImageLoader.h"

@implementation UIImageView (ImageLoader)

#pragma mark - Constants
#pragma mark - Session

static int HTTP_STATUS_CODE_OK = 200;
static int HTTP_STATUS_CODE_MULTIPLE_CHOICES = 300;

#pragma mark - Cache

int const Mbyte = 1024 * 1024;
int const URL_CACHE_MEMORY_CAPACITY = 5 * Mbyte;
int const URL_CACHE_DISK_CAPACITY = 20 * Mbyte;
NSString * const URL_CACHE_DISK_PATH = @"URLCache";


#pragma mark - Variables

static NSURLSession *session;
static NSMutableDictionary *currentlyLoadedImages;
static NSURLSessionConfiguration *sessionConfiguration;
static void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error);


#pragma mark - Work methods

- (void)displayImageWithURL:(NSString *)imageURL {
    [self initComponents];
    
    if (![currentlyLoadedImages objectForKey:imageURL]) {
        [currentlyLoadedImages setObject:self forKey:imageURL];
        [self prepareSessionAndLoad:imageURL];
    }
    
}


#pragma mark - Helper methods

- (void)initComponents {
    static dispatch_once_t isDispatched;
    dispatch_once(&isDispatched, ^{
        currentlyLoadedImages = [[NSMutableDictionary alloc] init];
        sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.timeoutIntervalForResource = 15; //wait resource for 15 secs
        session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
        completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {
            int responseStatusCode = ((NSHTTPURLResponse *)response).statusCode;
            if (!error && responseStatusCode >= HTTP_STATUS_CODE_OK && responseStatusCode <= HTTP_STATUS_CODE_MULTIPLE_CHOICES) {
                UIImageView *imageView = (UIImageView *)[currentlyLoadedImages objectForKey:response.URL.description];
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = [UIImage imageWithData:data];
                });
            } else {
                [self prepareSessionAndLoad:response.URL.description];
            }
        };
    });
}

- (void)prepareSessionAndLoad:(NSString *)imageURL {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}


//#pragma mark - NSURLSessionTaskDelegate methods
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
//    int responseStatusCode = ((NSHTTPURLResponse *)dataTask.response).statusCode;
//    if (responseStatusCode >= HTTP_STATUS_CODE_OK && responseStatusCode <= HTTP_STATUS_CODE_MULTIPLE_CHOICES) {
//        UIImageView *imageView = (UIImageView *)[currentlyLoadedImages objectForKey:dataTask.response.URL];
//        imageView.image = [UIImage imageWithData:data];
//    }
//}
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    if (!error) {
//        [currentlyLoadedImages removeObjectForKey:task.originalRequest.URL];
//    } else {
//        [task ]
//    }
//}


@end
