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
//Imort Data Manager
#import "DataManager.h"

@interface FirstViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    //Declare table view
    IBOutlet UITableView *tableView;
    
    //Declare test array
    NSMutableArray *testArray;
    
    //Declare request
    NSURLRequest *request;
    //Declare url
    NSURL *url;
    //Declare connection
    NSURLConnection *connection;
    //Declare mutable data for storing info from url
    NSMutableData *requestData;
    
    //Declare tag string for use in foundCharacter
    NSMutableString *currentTag;
    //Declare string to hold individual items. Mutable to allow appending string during parse
    NSMutableString *currentItem;
    //Declare array to hold all items from xml inside "channel" tag (first relevent tag)
    NSMutableArray *channelArray;
    //Declare instance of data manager
    DataManager *dataManager;
}

@end
