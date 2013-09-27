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
    
    //Declare local string to save band names
    NSMutableString *currentName;
    //Declare string to store band locations
    NSMutableString *currentLocation;
    //Declare local string to save song names
    NSMutableString *currentSong;
    //Declare local string to save album names
    NSMutableString *currentAlbum;
    //Declare local string to save song added dates
    NSMutableString *currentAdded;
    
    //Declare arrays to store all info after split from individual strings, split using \n that is inserted during parsing process. Not sure where \n is being added
    NSArray *bandNamesSplit;
    NSArray *bandLocationSplit;
    NSArray *songNameSplit;
    NSArray *albumNameSplit;
    NSArray *addedDateSplit;
    
    //Declare instance of data manager
    DataManager *dataManager;
}

@property (nonatomic, strong) NSMutableString *passedRawData;

@end
