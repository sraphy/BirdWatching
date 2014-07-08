//
//  BirdSighting.m
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _date = date;
        _image = image;
        return self;
    }
    return nil;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    //encode properties/values
    [aCoder encodeObject:self.name      forKey:@"name"];
    [aCoder encodeObject:self.location  forKey:@"location"];
    [aCoder encodeObject:self.date      forKey:@"date"];
    [aCoder encodeObject:self.image     forKey:@"image"];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super init])) {
        //decode properties/values
        self.name       = [aDecoder decodeObjectForKey:@"name"];
        self.location   = [aDecoder decodeObjectForKey:@"location"];
        self.date       = [aDecoder decodeObjectForKey:@"date"];
        self.image      = [aDecoder decodeObjectForKey:@"image"];
    }
    
    return self;
}
@end
