//
//  BirdSightingDataController.h
//  BirdWatching
//
//  Created by li crifan on 12-8-21.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BirdSighting;

//@interface BirdSightingDataController : NSObject <NSCoding>
@interface BirdSightingDataController : NSObject
{
    @private NSMutableArray *masterBirdSightingList;
}

@property (nonatomic, copy)NSMutableArray *masterBirdSightingList;

- (NSUInteger)countOfList;
- (BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation date:(NSDate *)date image:(UIImage *)image;
- (void)saveBirdSightingList;
//- (void)restoreBirdSightingList;

@end
