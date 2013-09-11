// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  AlbumsViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumsViewController : UIViewController <UITableViewDelegate>
{
    //All from project 1
    //Declare band array
    NSMutableArray *bandArray;
    //Declare album array
    NSMutableArray *albumArray;
    //Declare release date array
    NSMutableArray *releaseDateArray;
    //Declare country of origin array
    NSMutableArray *countryArray;
    
    //Declare IBOutlet for table view
    IBOutlet UITableView *tableView;
    //Declare IBOutlet for edit mode button
    IBOutlet UIButton *editButton;
}

//Set property for edit button to allow @synthesize
@property (strong) IBOutlet UIButton *editButton;

//Declare IBAction for onClick
-(IBAction)onClick:(id)sender;

@end
