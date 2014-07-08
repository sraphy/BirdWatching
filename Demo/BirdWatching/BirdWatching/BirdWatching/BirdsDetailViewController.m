//
//  BirdsDetailViewController.m
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import "BirdsDetailViewController.h"
#import "BirdSighting.h"

@interface BirdsDetailViewController ()
- (void)configureView;
@end

@implementation BirdsDetailViewController

#pragma mark - Managing the detail item

- (void)setSighting:(BirdSighting *)newSighting
{
    if (_sighting != newSighting) {
        _sighting = newSighting;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    BirdSighting *theSighting = self.sighting;
    static NSDateFormatter *formatter = nil;
    if( formatter == nil)
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if(theSighting)
    {
        self.birdNameLabel.text = theSighting.name;
        self.locationLabel.text = theSighting.location;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSighting.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.sighting = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

@end
