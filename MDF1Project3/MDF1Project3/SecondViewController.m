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
    _passedLocations = [LocationManager GetInstance];
    
    /*currentLocArray = [[NSMutableArray alloc] init];
    //NSLog(@"Current Loc = %@", currentLocArray);
    
    //currentLocArray = nil;
    [mapView removeAnnotations:currentLocArray];
    
    for (int i = 0; i<[_passedLocations.locationsArray count]; i++) {
        //NSLog(@"for loop hit");
        //currentLocArray = nil;
        //Cast location name into NSString to be injected into mapView for the annotation title
        locName = [[_passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Name"];
        //Cast lat and long values into NSArray to be changed to double. This is to avoid an incompatible error
        locLatLong = [[_passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Loc"];
        
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
        
        //Create array to hold current locations
        //NSMutableArray *currentLocArray = [[NSMutableArray alloc] init];
        
        //[mapView removeAnnotations:currentLocArray];
        
        _myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:locName coord:location];
        if (_myMapAnnotation != nil) {
            
            //Remove all annotations to check for changes
            //[mapView removeAnnotations:myMapAnnotation];
            
            //Add annotation pin to map view
            //[mapView addAnnotation:myMapAnnotation];
            
            [currentLocArray addObject:_myMapAnnotation];
        }
    
    }*/
    

    
    //Create a default span and zoom level (from project 3 videos)
    /*MKCoordinateSpan span;
    span.latitudeDelta = 20.0f;
    span.latitudeDelta = 20.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 28.55f;
    location.longitude = -81.33f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    CLLocationCoordinate2D orlandoLocation;
    orlandoLocation.latitude = 28.55f;
    orlandoLocation.longitude = -81.33f;
    
    CLLocationCoordinate2D coloradoLocation;
    coloradoLocation.latitude = 40.3707176f;
    coloradoLocation.longitude = -105.0697443f;*/
    
    //MyMapAnnotation *myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:@"Orlando" coord:orlandoLocation];
    /*if (myMapAnnotation != nil) {
        [mapView addAnnotation:myMapAnnotation];
    }*/
    
    //MyMapAnnotation *myMapAnnotation2 = [[MyMapAnnotation alloc] initWithTitle:@"Colorado" coord:coloradoLocation];
    /*if (myMapAnnotation2 != nil) {
        [mapView addAnnotation:myMapAnnotation2];
    }*/
    
        
    //Add annotations to map view
    //[mapView addAnnotations:[NSArray arrayWithObjects:myMapAnnotation, myMapAnnotation2, nil]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    
    
    
    //_passedLocations = [LocationManager GetInstance];
    
    currentLocArray = [[NSMutableArray alloc] init];
    //NSLog(@"Current Loc = %@", currentLocArray);
    
    //currentLocArray = nil;
    //[mapView removeAnnotations:currentLocArray];
    
    for (int i = 0; i<[_passedLocations.locationsArray count]; i++) {
        //NSLog(@"for loop hit");
        //currentLocArray = nil;
        //Cast location name into NSString to be injected into mapView for the annotation title
        locName = [[_passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Name"];
        //Cast lat and long values into NSArray to be changed to double. This is to avoid an incompatible error
        locLatLong = [[_passedLocations.locationsArray objectAtIndex:i] objectForKey:@"Loc"];
        
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
        
        //Create array to hold current locations
        //NSMutableArray *currentLocArray = [[NSMutableArray alloc] init];
        
        //[mapView removeAnnotations:currentLocArray];
        
        MyMapAnnotation *myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:locName coord:location];
        [currentLocArray addObject:myMapAnnotation];
        
        if (_myMapAnnotation != nil) {
            
            //Remove all annotations to check for changes
            //[mapView removeAnnotations:currentLocArray];
            
            //[currentLocArray addObject:_myMapAnnotation];
            
            //Add annotation pin to map view
            //[mapView addAnnotation:myMapAnnotation];
            
            [mapView addAnnotations:currentLocArray];
            
            //[mapView removeAnnotations:currentLocArray];
        }
        
    }
        //[mapView removeAnnotations:currentLocArray];
        
        
        [mapView addAnnotations:currentLocArray];
        NSLog(@"Current Loc = %lu", (unsigned long)currentLocArray.count);
    
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
