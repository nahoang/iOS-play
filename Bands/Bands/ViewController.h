//
//  ViewController.h
//  Bands
//
//  Created by hoang nguyen on 11/27/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBABand.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) WBABand *bandObject;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UIButton *saveNotesButton;
@property (nonatomic, weak) IBOutlet UIStepper *ratingStepper;
@property (nonatomic, weak) IBOutlet UILabel *ratingValueLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *touringStatusSegmentedControl;
@property (nonatomic, weak) IBOutlet UISwitch *haveSeenLiveSwitch;


- (IBAction)saveNotesButtonTouched:(id)sender;
- (IBAction)ratingStepperValueChanged:(id)sender;
- (IBAction)tourStatusSegmentedControlValueChanged:(id)sender;
- (IBAction)haveSeenLiveSwitchValueChanged:(id)sender;

- (void)saveBandObject;
- (void)loadBandObject;
- (void)setUserInterfaceValues;

@end

