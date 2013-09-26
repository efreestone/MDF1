// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  FirstViewController.m
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/21/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "FirstViewController.h"
//Import Detail View
#import "DetailViewController.h"
//Import Data Manager
#import "DataManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Music", @"Music");
        self.tabBarItem.image = [UIImage imageNamed:@"music"];
    }
    return self;
}

- (void)viewDidLoad
{
    //Load in xml data from app directory
    NSData *xmlData = [self GetFileDataFromFile:@"rock-new-feed.xml"];
    
    //Create xml parser
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    if (parser != nil) {
        [parser setDelegate:self];
        [parser parse];
    }
    
    //Create test array
    testArray = [[NSMutableArray alloc] initWithObjects:@"Test 1", @"Test 2", @"Test 3", @"Test 4", @"Test 5", @"Test 6", @"Test 7", @"Test 8", @"Test 9", @"Test 10", nil];
    
    //Create url. Using fullsail.com for testing
    url = [[NSURL alloc] initWithString:@"http://www.unsignedbandweb.com/rock-new-feed.xml"];
    
    //Create url request
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil) {
        //Create connection
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        //Create mutable data object for storing info from url
        requestData = [NSMutableData data];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Built in function for passed in data from url
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //Continuosly add data to mutabel data object
    //Check that there is valid data
    if (data != nil) {
        //Add new data to the existing mutable data object
        [requestData appendData:data];
    }
}

//Built in function to check if all data from the request has loaded and save to .xml in app directory
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //Convert text data from request to NSString
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil) {
        //Get path to app documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        if (documentsDirectory != nil) {
            //Create string with full path to directory
            NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"rock-new-feed.xml"];
            if (fullPath != nil) {
                [requestData writeToFile:fullPath atomically:true];
            }
        }
        
        //NSLog(@"%@", requestString);
    }
}

//Method to grab .xml file of requested data and convert to NSData object for parsing (from xmlParsing video)
-(NSData *)GetFileDataFromFile:(NSString *)fileName {
    //Nil out filePath
    NSString *filePath = nil;
    
    //Create file manager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //Get path to the app directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //Create full path to data file
    filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    //Make sure the path and file exists
    if ([fileManager fileExistsAtPath:filePath]) {
        //Return to NSData for the file
        return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

//Built in method
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"%@", attributeDict);
    
    currentTag = [[NSMutableString alloc] initWithFormat:@"%@", elementName];
    //NSLog(@"current tag = %@", currentTag);
    //Allocate dataManager once item tag is found
    if ([elementName isEqualToString:@"item"]) {
        //NSLog(@"Found item tag");
        //Create instance of data manager
        dataManager = [[DataManager alloc] init];
    } 
}

//Built in method. Parse values for each item to be further processed. Refactored from Stack Overflow
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //Check if curentItem has been allocated
    if (currentName == nil) {
        //Alloc mutable string
        currentName = [[NSMutableString alloc] initWithCapacity:50];
        NSLog(@"currentName created");
    } else if (currentLocation == nil) {
        currentLocation = [[NSMutableString alloc] initWithCapacity:50];
    } else if (currentSong == nil) {
        currentSong = [[NSMutableString alloc] initWithCapacity:50];
    } else if (currentAlbum == nil) {
        currentAlbum = [[NSMutableString alloc] initWithCapacity:50];
    } else if (currentAdded == nil)
    
    //Append item details to mutable string. The parse process adds "\n" between items that is used to seperate them into an array later. This was originally an if/else if, however the compiler didn't like it due to "dangling else statement".
    if ([currentTag isEqualToString:@"bandname"]) {
        //Append band names
        [currentName appendString:string];
    }
    if ([currentTag isEqualToString:@"bandlocation"]) {
        //Append band location
        [currentLocation appendString:string];
    }
    if ([currentTag isEqualToString:@"songname"]) {
        //Append song names
        [currentSong appendString:string];
    }
    if ([currentTag isEqualToString:@"songalbum"]) {
        //Append album name
        [currentAlbum appendString:string];
    }
    if ([currentTag isEqualToString:@"songaddeddate"]) {
        //Append added date
        [currentAdded appendString:string];
    }
}

//Built in method. Sent when an end tag is found.
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //Send item info strings to data manager. Not currently being used to display in table view or detail
    if ([elementName isEqualToString:@"bandname"]) {
        dataManager.currentBandName = currentName;
        //NSLog(@"Band name = %@", currentName);
    } else if ([elementName isEqualToString:@"bandlocation"]) {
        dataManager.currentBandLocation = currentLocation;
        //NSLog(@"Location = %@", currentLocation);
    } else if ([elementName isEqualToString:@"songname"]) {
        dataManager.currentSongName = currentSong;
        //NSLog(@"Current song = %@", currentSong);
    } else if ([elementName isEqualToString:@"songalbum"]) {
        dataManager.currentAlbumName = currentAlbum;
        //NSLog(@"Album = %@", currentAlbum);
    } else if ([elementName isEqualToString:@"songaddeddate"]) {
        dataManager.currentAddedDate = currentAdded;
        //NSLog(@"Song added = %@", currentAdded);
    }

    //Split item strings using \n. Creates local arrays that are used to fill table view cells and detail view
    bandNamesSplit = [currentName componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    //NSLog(@"names split - %@", bandNamesSplit);
    bandLocationSplit = [currentLocation componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    songNameSplit = [currentSong componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    albumNameSplit = [currentAlbum componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    addedDateSplit = [currentAdded componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
}

//From Project 1 videos
//Built in function to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [bandNamesSplit count];
}

//From Project 1 videos
//Built in function to set number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//From Project 1 videos
//Built in function to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    //Apply the location name to the table view cells
    cell.textLabel.text = (NSString *)[bandNamesSplit objectAtIndex:indexPath.row];

    return cell;
}

//Built in function to grab row selected in table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row = %d", indexPath.row);
    
    //Allocate detail view controllers
    DetailViewController *detailViewController_iPhone = [[DetailViewController alloc] initWithNibName:@"DetailView_iPhone" bundle:nil];
    DetailViewController *detailViewController_iPad = [[DetailViewController alloc] initWithNibName:@"DetailView_iPad" bundle:nil];
    
    //Check the device type and load the appropriate nib file for detail view
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //Device is iPhone
        if (detailViewController_iPhone != nil) {
            //Push detail view on top of table view
            [self.navigationController pushViewController:detailViewController_iPhone animated:true];
            //Set the nav bar title to the band name array item
            detailViewController_iPhone.title = (NSString *) [bandNamesSplit objectAtIndex:indexPath.row];
            //Set the band name label to the band name array item
            detailViewController_iPhone.bandNameLabel.text = (NSString *) [bandNamesSplit objectAtIndex:indexPath.row];
            //Set band location label to the location array item
            detailViewController_iPhone.locationLabel.text = (NSString *) [bandLocationSplit objectAtIndex:indexPath.row];
            //Set song name label to song name array item
            detailViewController_iPhone.songNameLabel.text = (NSString *) [songNameSplit objectAtIndex:indexPath.row];
        }
    } else {
        //Device is iPad
        if (detailViewController_iPad != nil) {
            //Push detail view on top of table view
            [self.navigationController pushViewController:detailViewController_iPad animated:true];
            //Set the nav bar title to the test array item
            detailViewController_iPad.title = (NSString *) [testArray objectAtIndex:indexPath.row];
            //Set the test label to the test array item
            detailViewController_iPad.bandNameLabel.text = (NSString *) [testArray objectAtIndex:indexPath.row];
        }
    }
}

@end
