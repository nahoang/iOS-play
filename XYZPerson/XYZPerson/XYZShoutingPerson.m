//
//  XYZShoutingPerson.m
//  XYZPerson
//
//  Created by hoang nguyen on 10/16/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZShoutingPerson.h"

@implementation XYZShoutingPerson
- (void)saySomething:(NSString *)greeting {
    NSString *uppercaseGreeting = [greeting uppercaseString];
//    NSLog(@"%@", uppercaseGreeting);
    [super saySomething:uppercaseGreeting];
}
@end
