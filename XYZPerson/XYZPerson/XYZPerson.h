//
//  XYZPerson.h
//  XYZPerson
//
//  Created by hoang nguyen on 10/16/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#ifndef XYZPerson_h
#define XYZPerson_h

@interface XYZPerson : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSDate *dateOfBirth;

- (void)sayHello;
- (void)saySomething:(NSString *)greeting;

@end

#endif /* XYZPerson_h */
