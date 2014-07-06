//
//  BirdSighting.h
//  BirdWatching
//
//  Created by sraphy on 26/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BirdSighting : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSDate *date;
-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date;
@end