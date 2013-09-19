// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  FirstViewController.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/14/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import Core Location
#import <CoreLocation/CoreLocation.h>
//Import location manager to gain access to singleton and save
#import "LocationManager.h"

@interface FirstViewController : UIViewController <UITableViewDelegate> //, CLLocationManagerDelegate
{
    //Test array for table view
    NSMutableArray *testArray;
    
    //Declare IBOutlet for table view
    IBOutlet UITableView *tableView;
    
    //Declare loaction with lat and long
    CLLocationManager *coreLocationManager;
    
    //Declare lat and long labels
    //IBOutlet UILabel *latLabel;
    //IBOutlet UILabel *longLabel;
}

//Create singleton locations holder
@property (nonatomic, strong) LocationManager *passedLocations;

@end
