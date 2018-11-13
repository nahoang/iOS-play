//
//  ViewController.h
//  DatePickerView
//
//  Created by hoang nguyen on 11/13/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)onValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@end

