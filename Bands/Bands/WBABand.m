//
//  WBABand.m
//  Bands
//
//  Created by hoang nguyen on 11/28/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import "WBABand.h"

static NSString *nameKey =  @"BANameKey";
static NSString *notesKey = @"BANotesKey";
static NSString *ratingKey = @"BARatingKey";
static NSString *tourStatusKey = @"BATourStatusKey";
static NSString *haveSeenLiveKey = @"BAHaveSeenLiveKey";

@implementation WBABand

- (id) initWithCoder:(NSCoder *)coder
{
    self = [super init];
    
    self.name = [coder decodeObjectForKey:nameKey];
    self.notes = [coder decodeObjectForKey:notesKey];
    self.rating = [coder decodeObjectForKey:ratingKey];
    self.touringStatus = [coder decodeObjectForKey:tourStatusKey];
    self.haveSeenLive = [coder decodeObjectForKey:haveSeenLiveKey];
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:nameKey];
    [coder encodeObject:self.notes forKey:notesKey];
    [coder encodeInteger:self.rating forKey:ratingKey];
    [coder encodeInteger:self.touringStatus forKey:tourStatusKey];
    [coder encodeBool:self.haveSeenLive forKey:haveSeenLiveKey];
}
@end
