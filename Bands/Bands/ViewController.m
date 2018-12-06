//
//  ViewController.m
//  Bands
//
//  Created by hoang nguyen on 11/27/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"

static NSString *bandObjectKey = @"BABandObjectKey";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"titleLable.text = %@", self.titleLabel.text);
    
    [self loadBandObject];
    if(!self.bandObject) {
        self.bandObject = [[WBABand alloc] init];
    }
    [self setUserInterfaceValues];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.bandObject.name = self.nameTextField.text;
    [self saveBandObject];
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    self.bandObject.name = self.nameTextField.text;
//    [self saveBandObject];
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.saveNotesButton.enabled = YES;
    return YES;
}

- (BOOL) textViewShouldEndEditing:(UITextField *)textView
{
    self.bandObject.notes = self.notesTextView.text;
    [self saveBandObject];
    [self.notesTextView resignFirstResponder];
    self.saveNotesButton.enabled = NO;
    return YES;
}

- (IBAction)saveNotesButtonTouched:(id)sender
{
    [self textViewShouldEndEditing:self.notesTextView];
}

- (IBAction)ratingStepperValueChanged:(id)sender
{
    self.ratingValueLabel.text = [NSString stringWithFormat:@"%g", self.ratingStepper.value];
    self.bandObject.rating = (int)self.ratingStepper.value;
    [self saveBandObject];
}

- (IBAction)tourStatusSegmentedControlValueChanged:(id)sender
{
    self.bandObject.touringStatus = self.touringStatusSegmentedControl.selectedSegmentIndex;
    [self saveBandObject];
}

- (IBAction)haveSeenLiveSwitchValueChanged:(id)sender
{
    self.bandObject.haveSeenLive = self.haveSeenLiveSwitch.on;
    [self saveBandObject];
}



- (void)saveBandObject
{
    NSData *bandObjectData = [NSKeyedArchiver archivedDataWithRootObject:self.bandObject];
    [[NSUserDefaults standardUserDefaults] setObject:bandObjectData forKey:bandObjectKey];
    //[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadBandObject
{
    NSData *bandObjectData = [[NSUserDefaults standardUserDefaults] objectForKey:bandObjectKey];
    if(bandObjectData) {
        self.bandObject = [NSKeyedUnarchiver unarchiveObjectWithData:bandObjectData];
    }
}

- (void)setUserInterfaceValues
{
    self.nameTextField.text = self.bandObject.name;
    self.notesTextView.text = self.bandObject.notes;
    self.ratingStepper.value = self.bandObject.rating;
    self.ratingValueLabel.text = [NSString stringWithFormat:@"%g", self.ratingStepper.value];
    self.touringStatusSegmentedControl.selectedSegmentIndex = self.bandObject.touringStatus;
    self.haveSeenLiveSwitch.on = self.bandObject.haveSeenLive;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
