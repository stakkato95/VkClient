//
//  VKCMainNavigationController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 21/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCMainNavigationController.h"
#import "VKCApi.h"
#import "VKCTokenStorage.h"

@interface VKCMainNavigationController ()

@end

@implementation VKCMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
