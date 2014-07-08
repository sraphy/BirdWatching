//
//  BirdsDetailViewController.h
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSighting;


@interface BirdsDetailViewController : UITableViewController
/*
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
*/
@property (strong, nonatomic) BirdSighting *sighting;
@property (weak, nonatomic) IBOutlet UILabel *birdNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end
