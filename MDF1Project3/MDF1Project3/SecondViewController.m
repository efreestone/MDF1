// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  SecondViewController.m
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/14/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "SecondViewController.h"
//Import my map annotation
#import "MyMapAnnotation.h"
//Import Location Manager singleton
#import "LocationManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    self.passedLocations = [LocationManager GetInstance];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    
    currentLocArray = [[NSMutableArray alloc] init];
    //NSLog(@"Current Loc before for loop = %@", currentLocArray);

    [mapView removeAnnotations:currentLocArray];
    
    for (int i = 0; i<[self.passedLocations.locationsArray count]; i++) {
        //Remove all annotations from map view before checking before redrawing without the deleted locations
        [mapView removeAnnotations:mapView.annotations];
        
        //This doesn't work to remove annotations. Deleted locations are still there when map view reloads. May have to do with the currentLocArray not being released but I am not sure
        //[mapView.self removeAnnotations:currentLocArray];
        
        //Cast location name into NSString to be injected into mapView for the annotation title
        locName = [[self.passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Name"];
        //Cast lat/long values into NSArray to be changed to double. This is to avoid an incompatible error (NSString to id)
        locLatLong = [[self.passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Loc"];
        
        //Cast lat and long into floats to be applied to map view and lat/long labels in detail view
        double locLat = [locLatLong[0] doubleValue];
        double locLang = [locLatLong[1] doubleValue];
        
        //Create and set map view annotation parameters
        //Create a default span and zoom level
        MKCoordinateSpan span;
        //Check device type and set span accordingly
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            //Device is iPhone
            span.latitudeDelta = 30.0f;
            span.latitudeDelta = 30.0f;
        } else {
            //Device is iPad
            span.latitudeDelta = 50.0f;
            span.longitudeDelta = 50.0f;
        }
        //Set lat and long with my doubles from above
        CLLocationCoordinate2D location;
        location.latitude = locLat;
        location.longitude = locLang;
        //Create coord for approximate center of Continental USA from survey in 1918. Near Lebanon, Kansas.
        CLLocationCoordinate2D centerUSA;
        centerUSA.latitude = 39.5f;
        centerUSA.longitude = -98.35f;
        
        //Set region and center with location
        MKCoordinateRegion region;
        region.center = centerUSA;
        region.span = span;
        mapView.region = region;

        //Allocate My Map Annotation
        MyMapAnnotation *myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:locName coord:location];
        [currentLocArray addObject:myMapAnnotation];
        
        if (myMapAnnotation != nil) {
            //Inject array into mapView to add annotations
            [mapView addAnnotations:currentLocArray];
        }
        
    }
    //NSLog(@"Current Loc = %lu", (unsigned long)currentLocArray.count);
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
