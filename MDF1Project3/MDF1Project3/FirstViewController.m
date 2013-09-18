// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  FirstViewController.m
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/14/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "FirstViewController.h"
//Import detail view
#import "DetailViewController.h"
//Import Location Manager Singleton
#import "LocationManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Test array for table view
    testArray = [[NSMutableArray alloc] initWithObjects:@"Location 1", @"Location 2", @"Location 3", @"Location 4", @"Location 5", @"Location 6", @"Location 7", @"Location 8", @"Location 9", @"Location 10", nil];
    
    LocationManager *locationManager = [LocationManager GetInstance];
    [locationManager getLocations];
    
    /*self.passedLocations = [LocationManager GetInstance];
    [self.passedLocations getLocations];*/
    
    //Add factory edit button to nav bar
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//From Project 1 videos
//Built in function to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [testArray count];
}

//From Project 1 videos
//Built in function to set number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//From Project 1 videos
//Built in function to add delete to cells in table view
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//From Project 1 videos
//Built in function to check editing style (-=delete, +=add)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //Check if in delete mode
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"We want to delete row = %d", indexPath.row);
        
        [testArray removeObjectAtIndex:indexPath.row];
        
        //Remove object from table view with animation. Receiving warning "local declaration of "tableView" hides instance variable". I may be missing something here but isn't this an Accessor method?
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

//From Project 1 videos
//Built in function to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = (NSString *)[self.passedLocations.namesArray objectAtIndex:indexPath.row];
    
    return cell;
}

//From Project 1 videos
//Built in function to grab row selected in table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row = %d Name = %@", indexPath.row, [self.passedLocations.namesArray objectAtIndex:indexPath.row]);
    
    LocationManager *locationManager = [LocationManager GetInstance];
    [locationManager getLocations];
    
    //Allocate iPhone Detail View nib
    DetailViewController *detailViewController_iPhone = [[DetailViewController alloc] initWithNibName:@"DetailView_iPhone" bundle:nil];
    //Alocate iPad Detail View nib
    DetailViewController *detailViewController_iPad = [[DetailViewController alloc] initWithNibName:@"DetailView_iPad" bundle:nil];
    //Check device (Modified from AppDelegate check)
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if (detailViewController_iPhone != nil) {
            //Push detail view on top of albums view (not from project 1)
            [self.navigationController pushViewController:detailViewController_iPhone animated:true];
            
            //Change nav bar title
            detailViewController_iPhone.title = (NSString *) [locationManager.namesArray objectAtIndex: indexPath.row];
            //Fill in test label
            detailViewController_iPhone.testLabel.text = [locationManager.cityArray objectAtIndex:indexPath.row];
        }
    } else {
        if (detailViewController_iPad != nil) {
            //Push detail view on top of albums view (not from project 1)
            [self.navigationController pushViewController:detailViewController_iPad animated:true];
            
            //Change nav bar title
            detailViewController_iPad.title = (NSString *) [testArray objectAtIndex:indexPath.row];
            //Fill in test label
            detailViewController_iPad.testLabel.text = [testArray objectAtIndex:indexPath.row];
        }
    }
    
}

//Override built in function to allow toggle of table view edit mode from button in nav bar. This didn't work in Project 2 for some reason and I'm not sure why.
-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
    [super setEditing:editing animated:animated];
    [tableView setEditing:editing animated:animated];
}


@end
