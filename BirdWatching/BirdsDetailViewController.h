//
//  BirdsDetailViewController.h
//  BirdWatching
//
//  Created by sraphy on 26/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSighting;
@interface BirdsDetailViewController : UITableViewController

@property (strong, nonatomic) BirdSighting *sighting;
@property (weak, nonatomic) IBOutlet UILabel *birdNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end