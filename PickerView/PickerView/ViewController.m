//
//  ViewController.m
//  PickerView
//
//  Created by hoang nguyen on 11/12/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end


@implementation ViewController
@synthesize cities;
@synthesize placesOfInterest;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    cities = [[NSArray alloc]
              initWithObjects:@"New York", @"London", @"Paris",
              @"Chicago", nil];
    placesOfInterest = [[NSArray alloc] initWithObjects:@"Museums", @"Clubs", @"Schools", @"Hotels", @"Airports", nil];
}

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [cities count];
    return [placesOfInterest count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [cities objectAtIndex:row];
    return [placesOfInterest objectAtIndex:row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onButtonPressed:(id)sender {
    int cityIndex = [_cityAndSubjectPicker selectedRowInComponent:0];
    int placeIndex = [_cityAndSubjectPicker selectedRowInComponent:1];
    NSString* messageText = [[NSString alloc] initWithFormat:@"Are you looking for %@ in %@?", [placesOfInterest objectAtIndex:placeIndex], [cities objectAtIndex:cityIndex]];
    
    UIAlertView* message = [[UIAlertView alloc]
                            initWithTitle:@""
                            message:messageText
                            delegate:nil
                            cancelButtonTitle:@"Yes"
                            otherButtonTitles:nil];
    [message show];
}
@end
