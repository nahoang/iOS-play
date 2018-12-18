//
//  WBABandsListTableViewController.h
//  Bands
//
//  Created by hoang nguyen on 12/7/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBABand, WBABandDetailsViewController;
@interface WBABandsListTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableDictionary *bandsDictionary;
@property (nonatomic, strong) NSMutableArray *firstLettersArray;
@property (nonatomic, strong) WBABandDetailsViewController *bandDetailsViewController;

- (void)addNewBand: (WBABand *)WBABand;
- (void)saveBandsDictionary;
- (void)loadBandsDictionary;

- (IBAction)addBandTouched:(id)sender;

@end
