// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  FirstViewController.h
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/21/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    //Declare table view
    IBOutlet UITableView *tableView;
    
    //Declare test array
    NSMutableArray *testArray;
}

//@property (strong) NSMutableArray *testArray;

@end
