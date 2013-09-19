// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  DetailViewController.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/16/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import map kit
#import <MapKit/MapKit.h>

#import "LocationManager.h"

@interface DetailViewController : UIViewController
{
    
    //Declare map view
    IBOutlet MKMapView *mapView;
    //Declare location name label
    IBOutlet UILabel *nameLabel;
    //Declare location city/state label
    IBOutlet UILabel *cityLabel;
    //Declare latitude label
    IBOutlet UILabel *latLabel;
    //Declare longitude label
    IBOutlet UILabel *longLabel;
}

//Create property to use synthesize for getter/setter
@property (strong) IBOutlet MKMapView *mapView;
@property (strong) IBOutlet UILabel *nameLabel;
@property (strong) IBOutlet UILabel *cityLabel;
@property (strong) IBOutlet UILabel *latLabel;
@property (strong) IBOutlet UILabel *longLabel;

@end
