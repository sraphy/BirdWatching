//
//  AddSightingViewController.m
//  BirdWatching
//
//  Created by sraphy on 30/6/14.
//  Copyright (c) 2014 TianYu Tech. All rights reserved.
//

#import "AddSightingViewController.h"
#import "BirdSighting.h"

@interface AddSightingViewController ()

@end

@implementation AddSightingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pickerArray = [NSArray arrayWithObjects:@"乌鸦",@"喜鹊",@"黄鹂",@"杜鹃",@"鸽子",@"猎隼", nil];
    self.birdNameInput.inputView = self.birdNamePicker;
    self.birdNameInput.delegate = self;
    
    self.birdNamePicker.delegate = self;
    self.birdNamePicker.dataSource = self;
    self.birdNamePicker.frame = CGRectMake(0, 480, 320, 216);
    
    self.dateInput.inputView = self.datePicker;
    self.dateInput.delegate = self;
    
    
//    self.datePicker.frame = CGRectMake(0, 480, 320, 216);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ((textField == self.birdNameInput) || (textField == self.locationInput) || (textField == self.dateInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == self.birdNameInput) {
        self.birdNamePicker.hidden = NO;
        self.datePicker.hidden = YES;
        self.birdNameInput.clearsOnBeginEditing = YES;
    }else if(textField == self.dateInput){
        self.datePicker.hidden = NO;
        self.birdNamePicker.hidden = YES;
//        self.dateInput.clearsOnBeginEditing = YES;
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField ==self.birdNameInput) {
        //第一时间给显示
        NSInteger row = [self.birdNamePicker selectedRowInComponent:0];
        self.birdNameInput.text = [pickerArray objectAtIndex:row];
        [self.birdNameInput reloadInputViews];
    }
//    else if (textField == self.dateInput){
//        self.dateInput.text = (NSString *)[self.datePicker date];
//        [self.dateInput reloadInputViews];
//    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.birdNamePicker) {
        self.birdNameInput.text = [pickerArray objectAtIndex:row];
        [self.birdNameInput reloadInputViews];
    }
//    else if(pickerView == self.datePicker){
//        
//        self.dateInput.text = (NSString *)[self.datePicker date];
//        [self.dateInput reloadInputViews];
//    }
    
}

-(IBAction)dateChanged:(id)sender{
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
    NSDate *selectedDate = self.datePicker.date;
    self.dateInput.text = [dateFormatter stringFromDate:selectedDate];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.birdNameInput) {
        self.birdNamePicker.hidden = YES;
    }else if (textField == self.dateInput){
        self.datePicker.hidden = YES;
    }
}



#pragma mark - Table view data source


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if ([self.birdNameInput.text length] || [self.locationInput.text length]) {
            BirdSighting *sighting;
            NSDate *today = [NSDate date];
            
            sighting = [[BirdSighting alloc] initWithName:self.birdNameInput.text location:self.locationInput.text date:today];
            self.birdSighting = sighting;
        }
    }
}


@end
