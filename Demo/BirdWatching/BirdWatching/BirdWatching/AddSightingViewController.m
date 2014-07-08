	//
//  AddSightingViewController.m
//  BirdWatching
//
//  Created by li crifan on 12-8-22.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import "AddSightingViewController.h"

@interface AddSightingViewController ()

@end

@implementation AddSightingViewController
/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
@synthesize datePicker = _datePicker;
@synthesize birdNamePickerView = _birdNameChoosed;
@synthesize birdNameInput = _birdNameInput;
@synthesize locationInput = _locationInput;
//@synthesize birdNameList = _birdNameList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    birdNameList = [[NSArray alloc] initWithObjects:@"Ostrich", @"Penguin", @"HummingBird", @"Peacock", @"Sparrow", nil];
    
    self.birdNamePickerView.delegate = self;
    [self.birdNamePickerView selectRow:1 inComponent:0 animated:YES];
    [self.birdNamePickerView reloadAllComponents];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    self.locationManager.delegate = self;
    
    self.curLocation = nil;
    
    [self.locationManager startUpdatingLocation];
    
    self.locationMapView.mapType = MKMapTypeStandard;
    self.locationMapView.showsUserLocation = YES;
    self.locationMapView.delegate = self;
    
    self.imgPickerController = [[UIImagePickerController alloc] init];
    self.imgPickerController.delegate = self;

    
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    imgTap.numberOfTapsRequired = 1;
    imgTap.numberOfTouchesRequired = 1;
    
    [self.birdImageView addGestureRecognizer:imgTap];
    
    [self.birdImageView setImage:[UIImage imageNamed:@"defaultBirdImage.gif"]];
    
//    if(self.birdNamePickerView.superview == nil)
//    {
//        CGRect startRect = CGRectMake(176, 130, 144, 216);
//        self.birdNamePickerView.frame = startRect;
//        
//                
//        UITableViewCell *birdNameCell = [self.addSightingTableView dequeueReusableCellWithIdentifier:@"BirdNameCell"];
//        
//        [birdNameCell addSubview:(UIView *)self.birdNamePickerView];
//		
//    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setBirdNameInput:nil];
    [self setLocationInput:nil];
    [self setBirdNamePickerView:nil];
    [self setDatePicker:nil];
    
    self.dateFormatter = nil;
    
    self.locationManager = nil;
    self.curLocation = nil;
        
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    //_birdNameInput.frame = CGRectMake(_birdNameInput.frame.origin.x, _birdNameInput.frame.origin.y, _birdNameInput.frame.size.width + 40, _birdNameInput.frame.size.height);
    //_locationInput.frame = CGRectMake(_locationInput.frame.origin.x, _locationInput.frame.origin.y, _locationInput.frame.size.width + 60, _locationInput.frame.size.height);
    
    if((toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)){
        _birdNameInput.frame = CGRectMake(_birdNameInput.frame.origin.x, _birdNameInput.frame.origin.y, 327, _birdNameInput.frame.size.height);
        _locationInput.frame = CGRectMake(_locationInput.frame.origin.x, _locationInput.frame.origin.y, 327, _locationInput.frame.size.height);
    }
    else if((toInterfaceOrientation == UIInterfaceOrientationPortrait) || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)){
        _birdNameInput.frame = CGRectMake(_birdNameInput.frame.origin.x, _birdNameInput.frame.origin.y, 168, _birdNameInput.frame.size.height);
        _locationInput.frame = CGRectMake(_locationInput.frame.origin.x, _locationInput.frame.origin.y, 168, _locationInput.frame.size.height);
    }    
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
*/

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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    UITableViewCell *selectedCell = [self.addSightingTableView cellForRowAtIndexPath:indexPath];

    if([selectedCell.reuseIdentifier isEqualToString: @"BirdNameCell"]){
        self.birdNamePickerView.hidden = FALSE;
        
        //[self.locationInput resignFirstResponder];
    }
    else
    {
        self.birdNamePickerView.hidden = TRUE;
    }
    
    if([selectedCell.reuseIdentifier isEqualToString: @"DateCell"]){
        self.datePicker.hidden = FALSE;
    }
    else
    {
        self.datePicker.hidden = TRUE;
    }
    
    if([selectedCell.reuseIdentifier isEqualToString: @"LocationCell"]){
        [self.locationInput resignFirstResponder];
        self.locationMapView.hidden = FALSE;
    }
    else
    {
        self.locationMapView.hidden = TRUE;
    }
    
    //if(![selectedCell.reuseIdentifier isEqualToString:@"LocationCell"]){
    //
    //}

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell *deSelectedCell = [self.addSightingTableView cellForRowAtIndexPath:indexPath];
    
    //if([deSelectedCell.reuseIdentifier isEqualToString: @"BirdNameCell"]){
    //    self.birdNamePickerView.hidden = TRUE;
    //}


}

- (IBAction)cancel:(id)sender {
    [[self delegate] addSightingViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addSightingViewControllerDidFinish:self name:self.birdNameInput.text location:self.locationInput.text date:self.datePicker.date image:self.birdImageView.image];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if((textField == self.birdNameInput) || (textField == self.locationInput))
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark PickerView DataSource

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return birdNameList.count;
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [birdNameList objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView Delegate


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSString* selectedBirdName = [birdNameList objectAtIndex:row];
    self.birdNameInput.text = selectedBirdName;
}

#pragma mark UIDatePicker
-(IBAction)dateChangedAction:(id)sender{
    NSDate* selectedDate = self.datePicker.date;
    NSString *formattedDateStr = [self.dateFormatter stringFromDate:selectedDate];
    self.dateInput.text = formattedDateStr;
}

#pragma  mark TextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.birdNamePickerView.hidden = TRUE;
    self.datePicker.hidden = TRUE;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(self.locationInput == textField)
    {
        [textField resignFirstResponder];
    }
}

#pragma mark -
#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    //NSString *locationDesciption = [[NSString alloc] initWithString:newLocation.description];
    self.locationInput.text = [[NSString alloc] initWithString:newLocation.description];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error){
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        //self.locationInput.text =placemark.subLocality;
        self.locationInput.text =placemark.ISOcountryCode;
    }];
    
//    CLLocationDegrees longitude = 37;
//    CLLocationDegrees latitude = 120;
//    
//    location2D.longitude = longitude;
//    location2D.latitude = latitude;
//    [self.locationMapView setCenterCoordinate:location2D animated:YES];
    
//    CLLocationCoordinate2D customLoc2D = CLLocationCoordinate2DMake(120.70549774169922, 31.27006030476515);
//    CLLocationCoordinate2D customLoc2D_2 = CLLocationCoordinate2DMake(120.701179385199, 31.2721052962652);
    //CLLocationCoordinate2D customLoc2D_4 = CLLocationCoordinate2DMake(120.7012, 31.2721);
    
    //CLLocationCoordinate2D customLoc2D_5 = CLLocationCoordinate2DMake(31.27006030476515, 120.70549774169922);
    //[self.locationMapView setCenterCoordinate:customLoc2D_5 animated:YES];
    
    
    //CLLocationCoordinate2D customLoc2D_3 =newLocation.coordinate;
    //[self.locationMapView setCenterCoordinate:customLoc2D_3 animated:YES];


    
    //    CLGeocoder *geocoder = [[CLGeocoder alloc] init];

    
    self.locationManager.delegate = nil;
    
}

#pragma mark -
#pragma mark MKMapViewDelegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{

    //self.locationInput.text = [[NSString alloc] initWithString:userLocation.description];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CLLocationCoordinate2D curLoc2D = self.locationMapView.centerCoordinate;
    
    NSString *locStr = [[NSString alloc] initWithFormat:@"<lat=%.4f,logi=%.4f>", curLoc2D.latitude,curLoc2D.longitude];
    self.locationInput.text = locStr;
    
    //self.locationInput.text = @"captured change";
}

//---------------------------------------------------------------
//handle the tap to image
-(void)handleImageTap:(UITapGestureRecognizer *)sender{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        NSArray *availableMediaTypeArr = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        
        self.imgPickerController.mediaTypes = availableMediaTypeArr;
        [self presentViewController:self.imgPickerController animated:YES completion:NULL];
    }
}
//---------------------------------------------------------------


#pragma -
#pragma UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //set selectd img to bird img
    
    //get selected image
    UIImage *selectedImg = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.birdImageView.image = selectedImg;
    [self dismissModalViewControllerAnimated:YES];
}

@end
