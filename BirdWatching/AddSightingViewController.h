//
//  AddSightingViewController.h
//  BirdWatching
//
//  Created by sraphy on 30/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSighting;


@interface AddSightingViewController : UITableViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
    NSArray *pickerArray;
}
@property (weak, nonatomic) IBOutlet UIPickerView *birdNamePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *birdNameInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (weak, nonatomic) IBOutlet UITextField *dateInput;
@property (strong,nonatomic) BirdSighting *birdSighting;

-(IBAction)dateChanged:(id)sender;

@end
