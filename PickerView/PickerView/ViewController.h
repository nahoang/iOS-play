//
//  ViewController.h
//  PickerView
//
//  Created by hoang nguyen on 11/12/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray* cities;
@property (strong, nonatomic) NSArray* placesOfInterest;
@property (weak, nonatomic) IBOutlet UIPickerView *cityAndSubjectPicker;
- (IBAction)onButtonPressed:(id)sender;

@end

