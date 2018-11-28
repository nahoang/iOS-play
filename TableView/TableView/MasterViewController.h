//
//  MasterViewController.h
//  TableView
//
//  Created by hoang nguyen on 11/14/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)toggleSections:(id)sender;

@end

