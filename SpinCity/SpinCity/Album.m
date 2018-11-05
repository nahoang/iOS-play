//
//  Album.m
//  SpinCity
//
//  Created by hoang nguyen on 10/18/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "Album.h"

@implementation Album

-(id)initWithTitle:(NSString *)title artist:(NSString *)artist summary:(NSString *)summary price:(float)price locationInStore:(NSString *)locationInStore {
    self = [super init];
    if(self) {
        _title = title;
        _artist = artist;
        _summary = summary;
        _price = price;
        _locationInStore = locationInStore;
        
        return self;
    }
    return nil;
}
@end
