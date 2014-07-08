//
//  AddSightingViewController.h
//  BirdWatching
//
//  Created by li crifan on 12-8-22.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@protocol AddSightingViewControllerDelegate;


@interface AddSightingViewController : UITableViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate, MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSArray *birdNameList;
    CLLocationCoordinate2D location2D;
}

@property (weak, nonatomic) id <AddSightingViewControllerDelegate> delegate;
//@property (strong, nonatomic) NSArray *birdNameList;

@property (weak, nonatomic) IBOutlet UITableView* addSightingTableView;
@property (weak, nonatomic) IBOutlet UIPickerView *birdNamePickerView;
@property (weak, nonatomic) IBOutlet UITextField *birdNameInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (weak, nonatomic) IBOutlet UITextField *dateInput;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic)       IBOutlet MKMapView *locationMapView;
@property (nonatomic)       IBOutlet UIImageView *birdImageView;

@property (retain, nonatomic) NSDateFormatter *dateFormatter;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *curLocation;
//@property (nonatomic, weak) UIImagePickerController *imgPickerController;
@property (nonatomic) UIImagePickerController *imgPickerController;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)dateChangedAction:(id)sender;

@end

@protocol AddSightingViewControllerDelegate <NSObject>

-(void)addSightingViewControllerDidCancel:(AddSightingViewController *)controller;
-(void)addSightingViewControllerDidFinish:(AddSightingViewController *)conterller name:(NSString *)name location:(NSString *)location date:(NSDate *)date image:(UIImage *)image;

@end
