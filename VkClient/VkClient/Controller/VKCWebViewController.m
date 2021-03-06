//
//  WebViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 16/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKCWebViewController.h"
#import "VKCApi.h"
#import "VKCWebKitMissingBase.h"
#import "VKCCredentialsStorage.h"
#import "VKCCredentials.h"

@interface VKCWebViewController()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property UIAlertView *alert;

@end

@implementation VKCWebViewController

#pragma mark - WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    VKCCredentials *credentials = [[VKCCredentialsStorage sharedInstance] obtainCredentials];
    if (credentials) {
        [[VKCApi sharedInstance] setCredentials:credentials];
        [self performSegue];
        return;
    }
    
    self.webView.delegate = self;
    [self sendAuthRequest];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([[VKCApi sharedInstance] checkForToken: request]) {
        [self performSegue];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self showActivityIndicator];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self hideActivityIndicator];
    if (self.webView.hidden) {
        self.webView.hidden = NO;
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self hideActivityIndicator];
    if (error.code != WebKitErrorFrameLoadInterruptedByPolicyChange) {
        self.alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Something has gone wrong while attempting to authorize you", @"Error title that is shown in login screen")
                                           message:[error localizedDescription]
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:NSLocalizedString(@"Retry", @"Button"), nil];
        [self.alert show];
    }
}


#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        [self.alert dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [self sendAuthRequest];
    }
}


#pragma mark - Help methods

- (void)hideActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.activityIndicator stopAnimating];
    //self.activityIndicator.hidden = YES;
}

- (void)showActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)sendAuthRequest {
    [self.webView loadRequest:[[VKCApi sharedInstance] getOAuthRequest]];
}

- (void)performSegue {
    [self performSegueWithIdentifier:@"showFriendsView" sender:self];
}

@end
