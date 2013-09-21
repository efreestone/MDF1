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
//Import My Map Annotation
#import "MyMapAnnotation.h"



@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locations", @"Locations");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    //Get instance of singleton
    self.passedLocations = [LocationManager GetInstance];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Test array for table view
    testArray = [[NSMutableArray alloc] initWithObjects:@"Location 1", @"Location 2", @"Location 3", @"Location 4", @"Location 5", @"Location 6", @"Location 7", @"Location 8", @"Location 9", @"Location 10", nil];
    
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
    return [self.passedLocations.locationsArray count];
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
        
        //Remove the deleted object from locationsArray
        [self.passedLocations.locationsArray removeObjectAtIndex:indexPath.row];
        
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
    
    //Apply the location name to the table view cells
    cell.textLabel.text = (NSString *)[[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
    return cell;
}

//From Project 1 videos
//Built in function to grab row selected in table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row = %d Name = %@", indexPath.row, [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"City"]);
    
    //Allocate iPhone Detail View nib
    DetailViewController *detailViewController_iPhone = [[DetailViewController alloc] initWithNibName:@"DetailView_iPhone" bundle:nil];
    //Alocate iPad Detail View nib
    DetailViewController *detailViewController_iPad = [[DetailViewController alloc] initWithNibName:@"DetailView_iPad" bundle:nil];
    
    //Cast location name into NSString to be injected into mapView for the annotation title
    NSString *locName = [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    //Cast lat and long values into NSArray to be changed to double. This is to avoid an incompatible error
    NSArray *locLatLong = [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Loc"];
    
    //Cast lat and long into floats to be applied to map view and lat/long labels in detail view
    double locLat = [locLatLong[0] doubleValue];
    double locLang = [locLatLong[1] doubleValue];
    
    //Create and set map view annotation parameters
    //Create a default span and zoom level
    MKCoordinateSpan span;
    span.latitudeDelta = 0.045f;
    span.latitudeDelta = 0.045f;
    //Set lat and long with my doubles from above
    CLLocationCoordinate2D location;
    location.latitude = locLat;
    location.longitude = locLang;
    //Set region and center with location
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    //These are passed in within the device check for cell selected. Keeping them out here causes span and region to not be set when my mapView is created
    //detailViewController_iPhone.mapView.region = region;
    //detailViewController_iPad.mapView.region = region;
    
    MyMapAnnotation *myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:locName coord:location];
    
    //Check device (Modified from AppDelegate check)
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //Device is iPhone
        if (detailViewController_iPhone != nil) {
            //Push detail view on top of albums view
            [self.navigationController pushViewController:detailViewController_iPhone animated:true];
            
            //Change nav bar title
            detailViewController_iPhone.title = (NSString *) [[self.passedLocations.locationsArray objectAtIndex: indexPath.row] objectForKey:@"Name"];
            
            //Set map view annotation
            if (myMapAnnotation != nil) {
                //Pass in span and region and span info from above
                detailViewController_iPhone.mapView.region = region;
                //Add annotation pin to map view
                [detailViewController_iPhone.mapView addAnnotation:myMapAnnotation];
                //NSLog(@"Form inside myMapAnnotation iPhone if statement");
            }
            
            //Fill in location name label
            detailViewController_iPhone.nameLabel.text = (NSString *) [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
            //Fill in city/state label
            detailViewController_iPhone.cityLabel.text = (NSString *) [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"City"];
            //Fill in lat label
            detailViewController_iPhone.latLabel.text = [NSString stringWithFormat:@"Latitude: %f", locLat];
            //Fill in long label
            detailViewController_iPhone.longLabel.text = [NSString stringWithFormat:@"Longitude: %f", locLang];
        }
    } else {
        //Device is iPad
        if (detailViewController_iPad != nil) {
            //Push detail view on top of albums view
            [self.navigationController pushViewController:detailViewController_iPad animated:true];
            
            //Change nav bar title
            detailViewController_iPad.title = (NSString *) [[self.passedLocations.locationsArray objectAtIndex: indexPath.row] objectForKey:@"Name"];
            
            //Set map view annotation
            if (myMapAnnotation != nil) {
                //Pass in span and region and span info from above
                detailViewController_iPad.mapView.region = region;
                //Add annotation pin to map view
                [detailViewController_iPad.mapView addAnnotation:myMapAnnotation];
                //NSLog(@"Form inside myMapAnnotation iPad if statement.");
            }
            
            //Fill in location name label
            detailViewController_iPad.nameLabel.text = (NSString *) [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
            //Fill in city/state label
            detailViewController_iPad.cityLabel.text = (NSString *) [[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"City"];
            //Fill in lat label
            detailViewController_iPad.latLabel.text = [NSString stringWithFormat:@"Latitude: %@",[[self.passedLocations.locationsArray objectAtIndex:indexPath.row] objectForKey:@"Lat"]];
            //Fill in lat label
            detailViewController_iPad.latLabel.text = [NSString stringWithFormat:@"Latitude: %f", locLat];
            //Fill in long label
            detailViewController_iPad.longLabel.text = [NSString stringWithFormat:@"Longitude: %f", locLang];
        }
    }
}

//Override built in function to allow toggle of table view edit mode from button in nav bar. This didn't work in Project 2 for some reason and I'm not sure why.
-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
    [super setEditing:editing animated:animated];
    [tableView setEditing:editing animated:animated];
}


@end
