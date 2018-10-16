//
//  main.m
//  XYZPerson
//
//  Created by hoang nguyen on 10/16/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        XYZShoutingPerson *person = [[XYZShoutingPerson alloc] init];
        [person sayHello];
    }
    return 0;
}
