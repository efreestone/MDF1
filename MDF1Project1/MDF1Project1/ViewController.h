// Elijah Freestone
// MDF1 1309
// Project 1
// September 2nd, 2013

//
//  ViewController.h
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //Declare band array
    NSMutableArray *bandArray;
    //Declare album array
    NSMutableArray *albumArray;
    
    //Declare IBOutlet for table view
    IBOutlet UITableView *tableView;
}

@end
