//
//  BirdsMasterViewController.m
//  BirdWatching
//
//  Created by li crifan on 12-8-20.
//  Copyright (c) 2012年 li crifan. All rights reserved.
//

#import "BirdsMasterViewController.h"

#import "BirdsDetailViewController.h"

#import "BirdSightingDataController.h"
#import "BirdSighting.h"

#import "AddSightingViewController.h"

@interface BirdsMasterViewController() <AddSightingViewControllerDelegate>
@end

/*
@interface BirdsMasterViewController () {
    NSMutableArray *_objects;
}
@end
*/

@implementation BirdsMasterViewController
@synthesize dataController = _dataController;

-(void) addSightingViewControllerDidCancel:(AddSightingViewController *)controller{

    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) addSightingViewControllerDidFinish:(AddSightingViewController *)conterller name:(NSString *)name location:(NSString *)location date:(NSDate *)date image:(UIImage *)image{
    if([name length] || [location length] || (date!=nil)){
        [self.dataController addBirdSightingWithName:name location:location date:date image:image];

        [[self tableView] reloadData];
    }
        
    [self dismissModalViewControllerAnimated:YES];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    /*
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
     */

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BirdSightingCell";
    
    static NSDateFormatter *formatter = nil;
    if( formatter == nil)
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    BirdSighting *sightingAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:sightingAtIndex.name];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex.date]];
    cell.imageView.image = sightingAtIndex.image;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController.masterBirdSightingList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
    
    [self.dataController saveBirdSightingList];
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    //BirdSighting *fromBird = [self.dataController.masterBirdSightingList objectAtIndex:fromIndexPath.row];
    [self.dataController.masterBirdSightingList exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    
    [self.dataController saveBirdSightingList];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowSightingDetails"]) {
        BirdsDetailViewController *detailViewController = [ segue destinationViewController];
        
        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    else if([[segue identifier] isEqualToString:@"ShowAddSightingView"]){
        AddSightingViewController *addController = (AddSightingViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

@end
