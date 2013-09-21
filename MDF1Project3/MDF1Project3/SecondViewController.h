// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  SecondViewController.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/14/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import map kit
#import <MapKit/MapKit.h>
//Import Location Manager singleton
#import "LocationManager.h"

#import "MyMapAnnotation.h"

@interface SecondViewController : UIViewController
{
    //Declare map view
    IBOutlet MKMapView *mapView;
    //Declare string to hold location name
    NSString *locName;
    //Declare array to hold lat/long
    NSArray *locLatLong;
    //Declare array for current locations
    NSMutableArray *currentLocArray;
}

//Create singleton locations holder
@property (nonatomic, strong) LocationManager *passedLocations;

@property (nonatomic, strong) MyMapAnnotation *myMapAnnotation;

@end
