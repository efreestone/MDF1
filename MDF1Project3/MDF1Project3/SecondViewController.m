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
    //Create a default span and zoom level (from project 3 videos)
    MKCoordinateSpan span;
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
    coloradoLocation.longitude = -105.0697443f;
    
    MyMapAnnotation *myMapAnnotation = [[MyMapAnnotation alloc] initWithTitle:@"Orlando" coord:orlandoLocation];
    /*if (myMapAnnotation != nil) {
        [mapView addAnnotation:myMapAnnotation];
    }*/
    
    MyMapAnnotation *myMapAnnotation2 = [[MyMapAnnotation alloc] initWithTitle:@"Colorado" coord:coloradoLocation];
    /*if (myMapAnnotation2 != nil) {
        [mapView addAnnotation:myMapAnnotation2];
    }*/
    
    //Add annotations to map view
    [mapView addAnnotations:[NSArray arrayWithObjects:myMapAnnotation, myMapAnnotation2, nil]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
