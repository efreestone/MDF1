// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  SecondViewController.m
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/21/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Raw Data", @"Raw Data");
        self.tabBarItem.image = [UIImage imageNamed:@"raw"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    NSData *requestData = [self GetFileDataFromFile:@"rock-new-feed.xml"];
    
    passedRawData = [[NSMutableString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    
    [textView setScrollEnabled:YES];
    
    textView.text = [textView.text stringByAppendingString:passedRawData];
    
    //NSLog(@"%@", passedRawData);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Method to grab .xml file of requested data and convert to NSData object for parsing (from xmlParsing video and first view controller)
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


@end
