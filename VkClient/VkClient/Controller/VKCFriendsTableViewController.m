//
//  VKCFriendsTableViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 22/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "VKCFriendsTableViewController.h"

@interface VKCFriendsTableViewController()

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - Internal properties

@property NSArray *friendsArray;

@end

@implementation VKCFriendsTableViewController

static NSString * const CELL_ID = @"friendsTableViewCell";
static int const FRIEND_NAME_TAG = 100;
static int const STATUS_TAG = 200;
static int const IMAGE_TAG = 300;


- (void)viewDidLoad {
    [super viewDidLoad];
    [[VKCApi sharedInstance] getFriends:self];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)configureCell:(id)cell atIndexPath:(NSIndexPath*)indexPath {
    //id object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    
    // Populate cell from the NSManagedObject instance
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    
    [self configureCell:cell atIndexPath:indexPath]; //TODO: MOVE TO THIS LOGIC
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:FRIEND_NAME_TAG];
    UILabel *statusLabel = (UILabel *)[cell viewWithTag:STATUS_TAG];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
    
    VKCUser *friend = [self.friendsArray objectAtIndex:indexPath.row];
    nameLabel.text = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
    statusLabel.text = friend.status;
    [imageView displayImageWithURL:friend.photo100];
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


#pragma mark - Callbakc

- (void)loadingStart {
    self.tableView.hidden = YES;
    [self.activityIndicator startAnimating];
}

- (void)loadingFinished:(id)data {
    self.tableView.hidden = NO;
    [self.activityIndicator stopAnimating];
    
    if (data) {
        [[VKCModelController sharedInstance] saveUsers:data];//TODO: JUST FOR TIME

        self.friendsArray = data;
        [self.tableView reloadData];
    }
}

- (void)loadingFailed:(id)error {
    self.tableView.hidden = YES;
    [self.activityIndicator stopAnimating];
}

@end
