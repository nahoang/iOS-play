//
//  WBABandsListTableViewController.m
//  Bands
//
//  Created by hoang nguyen on 12/7/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "WBABandsListTableViewController.h"
#import "WBABandDetailsViewController.h"
#import "WBABand.h"

@interface WBABandsListTableViewController ()

@end

static NSString *bandsDictionarytKey = @"BABandsDictionarytKey";

@implementation WBABandsListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBandsDictionary];
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.bandsDictionary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSString *firstLetter = [self.firstLettersArray objectAtIndex:section];
    NSMutableArray *bandsForLetter = [self.bandsDictionary objectForKey:firstLetter];
    return bandsForLetter.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
    NSString *firstLetter = [self.firstLettersArray objectAtIndex:indexPath.section];
    NSMutableArray *bandsForLetter = [self.bandsDictionary objectForKey:firstLetter];
    WBABand *bandObject = [bandsForLetter objectAtIndex:indexPath.row];
    
    //Configure the cell...
    cell.textLabel.text = bandObject.name;
    
    return cell;
}

- (void) addNewBand: (WBABand *)bandObject
{
    NSString *bandNameFirstLetter = [bandObject.name substringToIndex:1];
    NSMutableArray *bandsForLetter = [self.bandsDictionary objectForKey:bandNameFirstLetter];
    
    if(!bandsForLetter) {
        bandsForLetter = [NSMutableArray array];
    }
    
    [bandsForLetter addObject:bandObject];
    [bandsForLetter sortUsingSelector:@selector(compare:)];
    [self.bandsDictionary setObject:bandsForLetter forKey:bandNameFirstLetter];
    
    if(![self.firstLettersArray containsObject:bandNameFirstLetter])
    {
        [self.firstLettersArray addObject:bandNameFirstLetter];
        [self.firstLettersArray sortUsingSelector:@selector(compare:)];
    }
    [self saveBandsDictionary];
}

- (void) saveBandsDictionary
{
    NSData *bandsDictionaryData = [NSKeyedArchiver archivedDataWithRootObject:self.bandsDictionary];
    [[NSUserDefaults standardUserDefaults] setObject:bandsDictionaryData forKey:bandsDictionarytKey];
}

- (void) loadBandsDictionary
{
    NSData *bandsDictionaryData = [[NSUserDefaults standardUserDefaults] objectForKey:bandsDictionarytKey];
    
    if(bandsDictionaryData)
    {
        self.bandsDictionary = [NSKeyedUnarchiver
                                unarchiveObjectWithData:bandsDictionaryData];
        self.firstLettersArray = [NSMutableArray
                                  arrayWithArray:self.bandsDictionary.allKeys];
        [self.firstLettersArray sortUsingSelector:@selector(compare:)];
    }
    else
    {
        self.bandsDictionary = [NSMutableDictionary dictionary];
        self.firstLettersArray = [NSMutableArray array];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(self.bandDetailsViewController)
    {
        if(self.bandDetailsViewController.saveBand)
        {
            [self addNewBand:self.bandDetailsViewController.bandObject];
            [self.tableView reloadData];
        }
        self.bandDetailsViewController = nil;
    }
}

- (IBAction)addBandTouched:(id)sender
{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.bandDetailsViewController = (WBABandDetailsViewController *)[mainStoryBoard instantiateViewControllerWithIdentifier: @"bandDetails"];
    [self presentViewController:self.bandDetailsViewController animated:YES completion:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.firstLettersArray objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.firstLettersArray;
}

- (int)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(nonnull NSString *)title atIndex:(NSInteger)index
{
    return [self.firstLettersArray indexOfObject:title];
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



@end
