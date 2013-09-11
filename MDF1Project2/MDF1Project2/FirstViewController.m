// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  FirstViewController.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "FirstViewController.h"
//Import Albums view
#import "AlbumsViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        //Set icon to house
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//IBAction to grab tap of home screen image and pop on Album View. Whole image (all blue) is active
-(IBAction)onTap:(id)sender {
    NSLog(@"Picture clicked!!");
    
    //Allocate detail view controller
    AlbumsViewController *albumsViewController = [[AlbumsViewController alloc] initWithNibName:@"AlbumsView" bundle:nil];
    if (albumsViewController != nil) {
        //Push Albums view
        [self.navigationController pushViewController:albumsViewController animated:true];
        //[self presentViewController:albumsViewController animated:TRUE completion:nil];
    }
}



@end
