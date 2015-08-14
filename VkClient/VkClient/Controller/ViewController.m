//
//  ViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 13/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "ViewController.h"
#import "VKCUser.h"
#import "VKCNSString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    VKCUser *user = [VKCUser userWithFirstName:@"Artsiom" secondName:@"Kaliaha"];
    NSString *str = @"";
    BOOL result = [str vkc_isNilOrEmpty];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
