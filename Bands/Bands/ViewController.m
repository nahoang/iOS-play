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
    
    self.bandObject = [[WBABand alloc] init];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.bandObject.name = self.nameTextField.text;
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
}

- (IBAction)tourStatusSegmentedControlValueChanged:(id)sender
{
    self.bandObject.touringStatus = self.touringStatusSegmentedControl.selectedSegmentIndex;
}

- (IBAction)haveSeenLiveSwitchValueChanged:(id)sender
{
    self.bandObject.haveSeenLive = self.haveSeenLiveSwitch.on;
}



- (void)saveBandObject
{
    NSData *bandObjectData = [NSKeyedArchiver archivedDataWithRootObject:self.bandObject];
    [[NSUserDefaults standardUserDefaults] setObject:bandObjectData forKey:bandObjectKey];
    //[[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
