//
//  ViewController.m
//  DatePickerView
//
//  Created by hoang nguyen on 11/13/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _bottomLabel.text = @"";
    _topLabel.text = @"Please select a date!";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onValueChanged:(id)sender {
    // get today date
    NSDate* todayDate = [[NSDate alloc] init];
    
    //get date from date picker
    NSDate* pickerDate = _datePicker.date;
    
    NSTimeInterval dateDifferent = [pickerDate timeIntervalSinceDate:todayDate];
    double numDays = dateDifferent / (3600 * 24);
    _bottomLabel.text = [NSString stringWithFormat:@"Different from today (in days) = %2.0f", numDays];
    
    //display selected date as a string.
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"MMMM d, yyyy"];
    _topLabel.text = [NSString stringWithFormat:@"Selected date: %@", [dateFormat stringFromDate:pickerDate]];
}
@end
