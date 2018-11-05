//
//  ViewController.m
//  AlertSample
//
//  Created by hoang nguyen on 11/5/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIAlertView* message = [[UIAlertView alloc] initWithTitle:@"What is your name?" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    message.alertViewStyle = UIAlertViewStylePlainTextInput;
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField* field1 = [alertView textFieldAtIndex:0];
    _userLabel.text = [NSString stringWithFormat:@"User name: %@", field1.text];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
