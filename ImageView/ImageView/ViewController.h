//
//  ViewController.h
//  ImageView
//
//  Created by hoang nguyen on 11/8/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@property (weak, nonatomic) IBOutlet UIImageView *animatedImage;

- (void)handleTap: (UITapGestureRecognizer*)sender;

@end

