//
//  ViewController.m
//  LoginSample
//
//  Created by hoang nguyen on 11/1/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    [_usernameField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDismissKeyboard:(id)sender {
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
}

- (IBAction)onLogin:(id)sender {
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
    
    NSString* username = _usernameField.text;
    
    int length = [username length];
    if(length == 0)
        return;
    
    NSString* alertMessage = [NSString stringWithFormat:@"Welcome %@", username];
    UIAlertView* welcomeMessage = [[UIAlertView alloc] initWithTitle:@"Login successful" message:alertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [welcomeMessage show];
}

@end
