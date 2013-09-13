// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  ThirdViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate>
{
    //Declare array of titles
    NSArray *researchTitleArray;
    //Declare array of Author names
    NSArray *authorArray;
    //Declare array with abstract of research paper
    NSArray *abstractArray;
    //Declare array with article sources
    NSArray *sourceArray;
    //Declare array of urls to research articles
    NSArray *linksArray;
    
    //Declare table view
    IBOutlet UITableView *tableView;
}

@end
