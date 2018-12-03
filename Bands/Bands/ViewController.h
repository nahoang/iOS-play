//
//  ViewController.h
//  Bands
//
//  Created by hoang nguyen on 11/27/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBABand.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) WBABand *bandObject;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

