//
//  ViewController.m
//  Bands
//
//  Created by hoang nguyen on 11/27/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "WBABandDetailsViewController.h"

static NSString *bandObjectKey = @"BABandObjectKey";

@interface WBABandDetailsViewController ()

@end

@implementation WBABandDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"titleLable.text = %@", self.titleLabel.text);
    
    if(!self.bandObject) {
        self.bandObject = [[WBABand alloc] init];
    }
    [self setUserInterfaceValues];
    
    UITapGestureRecognizer *bandImageViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bandImageViewTapDetected)];
    bandImageViewTapGestureRecognizer.numberOfTapsRequired = 1;
    [self.bandImageView addGestureRecognizer:bandImageViewTapGestureRecognizer];
    
    UISwipeGestureRecognizer *bandImageViewSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(bandImageViewSwipeDetected)];
    bandImageViewSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.bandImageView addGestureRecognizer:bandImageViewSwipeGestureRecognizer];
    
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

- (void)setUserInterfaceValues
{
    self.nameTextField.text = self.bandObject.name;
    self.notesTextView.text = self.bandObject.notes;
    self.ratingStepper.value = self.bandObject.rating;
    self.ratingValueLabel.text = [NSString stringWithFormat:@"%g", self.ratingStepper.value];
    self.touringStatusSegmentedControl.selectedSegmentIndex = self.bandObject.touringStatus;
    self.haveSeenLiveSwitch.on = self.bandObject.haveSeenLive;
}

- (IBAction)deleteButtonTouched:(id)sender
{
    UIActionSheet *promptDeleteDataActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Band" otherButtonTitles:nil];
    [promptDeleteDataActionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.destructiveButtonIndex == buttonIndex)
    {
        self.bandObject = nil;
        self.saveBand = NO;
        if(self.navigationController)
            [self.navigationController popViewControllerAnimated:YES];
        else
            [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)saveButtonTouched:(id)sender
{
    if(!self.bandObject.name || self.bandObject.name.length == 0)
    {
        UIAlertView *noBandNameAlertView = [[UIAlertView alloc]
                                            initWithTitle:@"Error" message:@"Please supply a name for the band"
                                            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [noBandNameAlertView show];
    }
    else
    {
        self.saveBand = YES;
        if(self.navigationController)
            [self.navigationController popViewControllerAnimated:YES];
        else
            [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void) bandImageViewTapDetected
{
    NSLog(@"band image tap detected");
}

- (void) bandImageViewSwipeDetected
{
    NSLog(@"band image swipe detected");
}
//- (IBAction)saveButtonTouched:(id)sender
//{
//    if(self.bandObject.name && self.bandObject.name.length > 0)
//    {
//        self.saveBand = YES;
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//    else
//    {
//        UIAlertView *noBandNameAlertView = [[UIAlertView alloc]
//                                            initWithTitle:@"Error" message:@"Please supply a name for the band"
//                                            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [noBandNameAlertView show];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
