// Elijah Freestone
// MDF1 1309
// Project 1
// September 2nd, 2013

//
//  ViewController.m
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"
//Import custom table view cell
#import "CustomTableViewCell.h"
//Import detail view controller
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //Create editable array with 20 band names
    bandArray = [[NSMutableArray alloc] initWithObjects:@"Amaranthe", @"Amaranthe", @"All That Remains", @"Killswitch Engage", @"Killswitch Engage", @"Killswitch Engage", @"Disarmonia Mundi", @"Disarmonia Mundi", @"Shinedown", @"Shinedown", @"Shinedown", @"Shinedown", @"Soilwork", @"Soilwork", @"Soilwork", @"Soilwork", @"Battlecross", @"Battlecross", @"Allegaeon", @"Diecast", nil];
    
    //Create editable array with 20 Album titles
    albumArray = [[NSMutableArray alloc] initWithObjects:@"Amaranthe", @"The Nexus", @"The Fall of Ideals", @"The End of Heartache", @"As Daylight Dies", @"Disarm the Descent", @"Fragments of D-Generation", @"Mind Tricks", @"Leave a Whisper", @"Us and Them", @"The Sound of Madness", @"Amarylis", @"Stabbing the Drama", @"Sworn to a Great Divide", @"The Panic Broadcast", @"The Living Infinite", @"Pursuit of Honor", @"War of Will", @"Fragments of Form and Function", @"Internal Revolution", nil];
    
    //Create editable array with 20 release dates
    releaseDateArray = [[NSMutableArray alloc] initWithObjects:@"2011", @"2013", @"2006", @"2004", @"2006", @"2013", @"2004", @"2006", @"2003", @"2005", @"2008", @"2012", @"2005", @"2007", @"2010", @"2013", @"2011", @"2013", @"2010", @"2006", nil];
    
    //Create editable array with 20 countries of origin
    countryArray = [[NSMutableArray alloc] initWithObjects:@"Sweden/Denmark", @"Sweden/Denmark", @"United States", @"United States", @"United States", @"United States", @"Italy/Sweden", @"Italy/Sweden", @"United States", @"United States", @"United States", @"United States", @"Sweden", @"Sweden", @"Sweden", @"Sweden", @"United States", @"United States", @"United States", @"United States", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//onClick function to grab button clicks, currently only used for edit button
-(IBAction)onClick:(id)sender {
    //Cast clear and save into a UIButton
    UIButton *buttonClicked = (UIButton *)sender;
    
    if (buttonClicked != nil) {
        //Edit button
        if (buttonClicked.tag == 0) {
            //Set edit mode to true
            [tableView setEditing:true];
            //Set button title to "Done"
            [editButton setTitle:@"Done" forState:0];
            //Change tag number to 1 to hit else statement and return to non-edit mode. This may need changed when more buttons are added
            editButton.tag = 1;
        } else {
            //Turn editing mode off
            [tableView setEditing:false];
            //Set title back to "Edit"
            [editButton setTitle:@"Edit" forState:0];
            //Reset tag number to 0
            editButton.tag = 0;
        }
    }
}

//Built in function to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [albumArray count];
}

//Built in function to set number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//Built in function to add delete to cells in table view
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//Built in function to check editing style (-=delete, +=add)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //Check if in delete mode
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"We want to delete row = %d", indexPath.row);
        
        //Remove object from band array
        [bandArray removeObjectAtIndex:indexPath.row];
        //Remove object from album array
        [albumArray removeObjectAtIndex:indexPath.row];
        //Remove object from date array
        [releaseDateArray removeObjectAtIndex:indexPath.row];
        //Remove object from country array
        [countryArray removeObjectAtIndex:indexPath.row];
        
        //Remove object from table view with animation. Receiving warning "local declaration of "tableView" hides instance variable". I may be missing something here but Isn't this an Accessor method?
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

//Built in function to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Set cell identifier to static NSString
    static NSString *CellIdentifier = @"Cell";
    
    //Reuse cells to avoid unneeded allocs
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //Load nib for custom view cell
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"IphoneCustomViewCell" owner:nil options:nil];
        
        //Loop through views to make sure CustomTableViewCell is a
        for (UIView *view in views) {
            if ([view isKindOfClass:[CustomTableViewCell class]]) {
                cell = (CustomTableViewCell *)view;
                
                //Apply band names to top label of custom cell
                cell.bandLabel.text = [bandArray objectAtIndex:indexPath.row];
                //Apply album name to bottom label of custom cell
                cell.albumLabel.text = [albumArray objectAtIndex:indexPath.row];
            }
        }
        
    }
    return cell;
}

//Built in function to grab row selected in table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row = %d Album = %@", indexPath.row, [albumArray objectAtIndex:indexPath.row]);
    
    //Allocate detail view controller
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    if (detailViewController != nil) {
        [self presentViewController:detailViewController animated:TRUE completion:nil];
        
        //Change title label of detail view to band name
        detailViewController.titleLabel.text = (NSString *)[bandArray objectAtIndex:indexPath.row];
        //Add band name to first label on detail view
        detailViewController.bandLabel.text = [NSString stringWithFormat:@"Band Name: %@", [bandArray objectAtIndex:indexPath.row]];
        //Add album name to second label on detail view
        detailViewController.albumLabel.text = [NSString stringWithFormat:@"Album Name: %@", [albumArray objectAtIndex:indexPath.row]];
        //Add release date to third label on detail view
        detailViewController.releaseDateLabel.text = [NSString stringWithFormat:@"Year Released: %@", [releaseDateArray objectAtIndex:indexPath.row]];
        //Add country of origin to fourth label on detail view
        detailViewController.countryLabel.text = [NSString stringWithFormat:@"Country of Origin: %@", [countryArray objectAtIndex:indexPath.row]];
    }
}

@end
