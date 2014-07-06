//
//  BirdSighting.m
//  BirdWatching
//
//  Created by sraphy on 26/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting
-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date
{
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _date = date;
        return self;
    }
    return nil;
}
@end