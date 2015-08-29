//
//  VKCFriendsTableViewController.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 22/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKCCallback.h"
#import "VKCApi.h"

@interface VKCFriendsTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, VKCCallback>

@end