//
//  BirdSightingDataController.m
//  BirdWatching
//
//  Created by li crifan on 12-8-21.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import "BirdSightingDataController.h"
#import "BirdSighting.h"

@interface BirdSightingDataController()
-(void)initializeDefaultDataList;
@end

@implementation BirdSightingDataController

-(void)initializeDefaultDataList{  
    //NSMutableArray *sightingList = [[NSMutableArray alloc] init];
    //self.masterBirdSightingList = sightingList;
    //[self addBirdSightingWithName:@"Pigeon" location:@"Everywhere" date:[NSDate date] image:[UIImage imageNamed:@"defaultBirdImage.gif"] ];
    
    //restore data
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *savedEncodedData = [defaults objectForKey:@"BirdSightingList"];
//    self.masterBirdSightingList = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *prevSavedData = [defaults objectForKey:@"SingleBirdSightingObject"];
//    BirdSighting *decodedSingleObj = (BirdSighting *)[NSKeyedUnarchiver unarchiveObjectWithData:prevSavedData];
//    if(decodedSingleObj != nil)
//    {
//        [self.masterBirdSightingList addObject:decodedSingleObj];
//    }
    
    //restore data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *savedEncodedData = [defaults objectForKey:@"BirdSightingList"];
    if(savedEncodedData == nil)
    {
        NSMutableArray *sightingList = [[NSMutableArray alloc] init];
        self.masterBirdSightingList = sightingList;
    }
    else{
        self.masterBirdSightingList = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:savedEncodedData];
    }
    
}


-(void)setMasterBirdSightingList:(NSMutableArray *)newList{
    if(_masterBirdSightingList != newList)
    {
        _masterBirdSightingList = [newList mutableCopy];
    }

}

-(id)init{
    if(self = [super init])
    {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;	
}

-(NSUInteger)countOfList{
    return [self.masterBirdSightingList count];
}

-(BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterBirdSightingList objectAtIndex:theIndex];
}

-(void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation date:(NSDate *)date image:(UIImage *)image{
    BirdSighting *sighting;
    //NSDate *today = [NSDate date];
    //sighting = [[BirdSighting alloc]initWithName:inputBirdName location:inputLocation date:today];
    sighting = [[BirdSighting alloc]initWithName:inputBirdName location:inputLocation date:date image:image];
    [self.masterBirdSightingList addObject:sighting];
    
    [self saveBirdSightingList];

}

- (void)saveBirdSightingList{
    //    NSData *encodedSingleObj = [NSKeyedArchiver archivedDataWithRootObject:sighting];
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    [defaults setObject:encodedSingleObj forKey:@"SingleBirdSightingObject"];
    
    //save data
    NSData *encodedCurBirdSightingList = [NSKeyedArchiver archivedDataWithRootObject:self.masterBirdSightingList];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedCurBirdSightingList forKey:@"BirdSightingList"];
    [defaults synchronize];
}

@end

