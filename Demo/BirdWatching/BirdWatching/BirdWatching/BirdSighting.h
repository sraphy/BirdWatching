//
//  BirdSighting.h
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BirdSighting : NSObject  <NSCoding>
{

}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic) UIImage *image;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date image:(UIImage *)image;

@end
