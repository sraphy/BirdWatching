//
//  BirdsMasterViewController.h
//  BirdWatching
//
//  Created by sraphy on 26/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSightingDataController;

@interface BirdsMasterViewController : UITableViewController

@property (strong, nonatomic) BirdSightingDataController *dataController;

-(IBAction)done:(UIStoryboardSegue *)segue;
-(IBAction)cancel:(UIStoryboardSegue *)segue;

@end
