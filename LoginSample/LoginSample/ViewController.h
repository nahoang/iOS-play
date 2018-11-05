//
//  ViewController.h
//  LoginSample
//
//  Created by hoang nguyen on 11/1/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)onDismissKeyboard:(id)sender;
- (IBAction)onLogin:(id)sender;
- (void) handleBackgroundTap: (UITapGestureRecognizer*)sender;

@end

