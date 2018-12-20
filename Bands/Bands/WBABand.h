//
//  WBABand.h
//  Bands
//
//  Created by hoang nguyen on 11/28/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

typedef enum {
    WBATouringStatusOnTour,
    WBATouringStatusOffTour,
    WBATouringStatusDisbanded
} WBATouringStatus;

@interface WBABand : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, assign) int rating;
@property (nonatomic, assign) WBATouringStatus touringStatus;
@property (nonatomic, assign) BOOL haveSeenLive;
@property (nonatomic, strong) UIImage *bandImage;

@end
