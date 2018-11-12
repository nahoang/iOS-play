//
//  ViewController.m
//  ImageView
//
//  Created by hoang nguyen on 11/8/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    //setup animatedImage
    NSArray* frameArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"anim1.png"],
                           [UIImage imageNamed:@"anim2.png"],
                           [UIImage imageNamed:@"anim3.png"],
                           [UIImage imageNamed:@"anim4.png"],
                           [UIImage imageNamed:@"anim5.png"],
                           [UIImage imageNamed:@"anim6.png"],nil
                           ];
    _animatedImage.animationImages = frameArray;
    _animatedImage.animationDuration = 0.5;
    _animatedImage.animationRepeatCount = 1;
    _animatedImage.userInteractionEnabled = NO;
    [_animatedImage setHidden:YES];
    
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    CGPoint startLocation = [sender locationInView:self.view];
    if((startLocation.y >=  211) && (startLocation.x <= (211 + 104)))
    {
        [_animatedImage setHidden:NO];
        [_animatedImage startAnimating];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
