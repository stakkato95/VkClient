//
//  WebViewController.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 16/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKCWebViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate> {
    
    UIAlertView *alert;
    
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end
