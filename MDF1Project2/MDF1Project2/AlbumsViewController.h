//
//  AlbumsViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumsViewController : UIViewController
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

//Declare IBAction for onClick
-(IBAction)onClick:(id)sender;

@end
