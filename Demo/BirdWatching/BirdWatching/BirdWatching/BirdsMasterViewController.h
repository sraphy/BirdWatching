//
//  BirdsMasterViewController.h
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSightingDataController;


@interface BirdsMasterViewController : UITableViewController
@property (strong, nonatomic) BirdSightingDataController *dataController;
@end
