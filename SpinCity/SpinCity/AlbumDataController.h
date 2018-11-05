//
//  AlbumDataController.h
//  SpinCity
//
//  Created by hoang nguyen on 10/18/18.
//  Copyright © 2018 hoang nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Album;

@interface AlbumDataController : NSObject
- (NSUInteger)albumCount;
- (Album *)albumAtIndex: (NSUInteger)index;
- (void)addAlbumWithTitle: (NSString *)title artist: (NSString *)artist summary: (NSString *)summary price: (float)price locationInStore: (NSString *)locationInStore;

@end
