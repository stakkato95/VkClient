//
//  VKCFriendsTableViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 22/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCFriendsTableViewController.h"

@interface VKCFriendsTableViewController()

@property UIActivityIndicatorView *activityIndicator;
@property NSArray *friendsArray;

@end

@implementation VKCFriendsTableViewController

static NSString * const CELL_ID = @"friendsCell";
static NSString * const ERROR_LABEL_FONT_NAME = @"AppleSDGothicNeo-Light";
static NSString * const REFRESH_DATE_FORMAT = @"HH:mm:ss";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self initActivityIndicator];
    [self initRefreshControl];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VKCFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    VKCUser *friend = [self.friendsArray objectAtIndex:indexPath.row];
    
    cell.name.text = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
    cell.status.text = friend.status;
    [cell.photo displayImageWithURL:friend.photo100];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Helper methods

- (void)initActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.center = CGPointMake(0, 0);
    self.activityIndicator.hidesWhenStopped = YES;
    self.tableView.backgroundView = self.activityIndicator;
}

- (void)initRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor iosLightBlue];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
}

- (void)setResfreshTitle {
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    dateFormatte.dateFormat = REFRESH_DATE_FORMAT;
    NSString *refreshTitle = [NSString stringWithFormat:NSLocalizedString(@"Last update: %@", @"Refresh control's update text"), [dateFormatte stringFromDate:[NSDate date]]];
    NSDictionary *attributesDictionary = @{NSFontAttributeName : [UIFont fontWithName:ERROR_LABEL_FONT_NAME size:20],
                                           NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:refreshTitle attributes:attributesDictionary];
}

- (void)showErrorMessage {
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    errorLabel.text = NSLocalizedString(@"Hm....something gone wrong with data=(", @"Error label shown in friends table view");
    errorLabel.textColor = [UIColor blackColor];
    errorLabel.numberOfLines = 0;
    errorLabel.textAlignment = NSTextAlignmentCenter;
    errorLabel.font = [UIFont fontWithName:ERROR_LABEL_FONT_NAME size:20];
    [errorLabel sizeToFit];
    self.tableView.backgroundView = errorLabel;
}

- (void)loadData {
    [[VKCApi sharedInstance] getFriends:self];
}

#pragma mark - Callbakc

- (void)loadingStart {
    [self.activityIndicator startAnimating];
}

- (void)loadingFinished:(id)data {
    if (self.refreshControl.isRefreshing) {
        [self setResfreshTitle];
        [self.refreshControl endRefreshing];
    }
    
    if (data) {
        [[VKCModelController sharedInstance] saveUsers:data];//TODO: JUST FOR TIME
        self.friendsArray = data;
        [self.tableView reloadData];
        [self.activityIndicator stopAnimating];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return;
    }
    [self loadingFailed:nil];

}

- (void)loadingFailed:(id)error {
    [self showErrorMessage];
    [self.activityIndicator stopAnimating];
}

@end
