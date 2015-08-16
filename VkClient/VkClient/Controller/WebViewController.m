//
//  WebViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 16/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "WebViewController.h"
#import "VKCApi.h"

@implementation WebViewController

#pragma mark - WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self.webView loadRequest:[VKCApi getOAuthPath]];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(webView.request.URL.absoluteString);
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [VKCApi checkForToken: webView.request];
    NSLog(@"%@", webView.request);
    
    [self hideActivityIndicator];
    self.webView.hidden = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //add STRINGS to to alert FROM RESOURCES!!!!!!!
    //ALERT DIALOG must be here!!!
    [self hideActivityIndicator];
}


#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
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
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}

@end
