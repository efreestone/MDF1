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
//Import location manager to gain access to singleton and save
#import "LocationManager.h"
//Import map kit
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate>
{
    //Test array for table view
    NSMutableArray *testArray;
    
    //Declare IBOutlet for table view
    IBOutlet UITableView *tableView;
}

//Create singleton locations holder
@property (nonatomic, strong) LocationManager *passedLocations;

@end
