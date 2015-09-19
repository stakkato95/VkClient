//
//  VKCFriendTableViewCell.h
//  VkClient
//
//  Created by Artsiom Kaliaha on 19/09/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKCFriendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end
