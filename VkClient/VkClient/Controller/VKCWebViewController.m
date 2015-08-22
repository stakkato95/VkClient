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

@implementation VKCWebViewController

#pragma mark - WebViewController`

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self sendAuthRequest];
    
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([[VKCApi sharedInstance] checkForToken: request]) {
        [self performSegueWithIdentifier:@"showFriendsView" sender:self];
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
        alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Something has gone wrong while attempting to authorize you", @"Error title that is shown in login screen")
                                           message:[error localizedDescription]
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:NSLocalizedString(@"Retry", @"Button"), nil];
        [alert show];
    }
}


#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        [alert dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [self sendAuthRequest];
    }
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView {
    
}

// before animation and showing view
- (void)willPresentAlertView:(UIAlertView *)alertView {
    
}

// after animation
- (void)didPresentAlertView:(UIAlertView *)alertView {
    
}

// before animation and hiding view
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

// after animation
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    return YES;
}


#pragma mark - Help methods

- (void)hideActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}

- (void)showActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)sendAuthRequest {
    [self.webView loadRequest:[[VKCApi sharedInstance] getOAuthRequest]];
}

@end
