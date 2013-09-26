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
    //NSLog(@"currentItem = %@", currentTag);
    //Parse band name tag
    if ([elementName isEqualToString:@"channel"]){
        //NSLog(@"Found channel tag");
        //Save all results from xml file in an array
        channelArray = [[NSMutableArray alloc] init];
        return;
    } else if ([elementName isEqualToString:@"item"]) {
        //NSLog(@"Found item tag");
        //Create instance of data manager
        dataManager = [[DataManager alloc] init];
    } 
}

//Built in method. Parse values for each item to be further processed. Refactored from Stack Overflow
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //Check if curentItem has been allocated
    if (currentItem == nil) {
        //Alloc mutable string
        currentItem = [[NSMutableString alloc] initWithCapacity:50];
        NSLog(@"currentItem created");
        //[currentItem appendString:string];
    }
    
    //If bandname tag
    if ([currentTag isEqualToString:@"item"]) {
        [currentItem appendString:string];
        //NEED TO DO INDIVIDUAL ITEMS!! IE currentName, currentLocation etc instead of currentItem
    }
}

//Built in method. Sent when an end tag is found.
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"bandname"]) {
        //NSLog(@"Band name before data manager = %@", currentItem);
        //[currentItem appendString:];
        dataManager.currentBandName = currentItem;
        NSLog(@"Band name = %@", currentItem);
        currentItem = nil;
        //NSLog(@"Band name after nil = %@", currentItem);
        return;
    }
    
    /*if ([elementName isEqualToString:@"item"]) {
        // addresses and currentPerson are instance variables
        [channelArray addObject:currentItem];
        currentItem = nil;
        NSLog(@" Array = %@", channelArray);
        return;
    }*/
    
    
}

//From Project 1 videos
//Built in function to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [testArray count];
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
    cell.textLabel.text = (NSString *)[testArray objectAtIndex:indexPath.row];

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
            //Set the nav bar title to the test array item
            detailViewController_iPhone.title = (NSString *) [testArray objectAtIndex:indexPath.row];
            //Set the test label to the test array item
            detailViewController_iPhone.testLabel.text = (NSString *) [testArray objectAtIndex:indexPath.row];
        }
    } else {
        //Device is iPad
        if (detailViewController_iPad != nil) {
            //Push detail view on top of table view
            [self.navigationController pushViewController:detailViewController_iPad animated:true];
            //Set the nav bar title to the test array item
            detailViewController_iPad.title = (NSString *) [testArray objectAtIndex:indexPath.row];
            //Set the test label to the test array item
            detailViewController_iPad.testLabel.text = (NSString *) [testArray objectAtIndex:indexPath.row];
        }
    }
}

@end
