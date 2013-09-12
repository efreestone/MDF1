// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  DetailViewController.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

//From Project 1
//Synthesize image and all 4 labels for getter/setter to get access from ViewController.m
@synthesize coverImage;
@synthesize bandLabel;
@synthesize albumLabel;
@synthesize releaseDateLabel;
@synthesize countryLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Set background color to blue from splash and icons
    self.view.backgroundColor = [UIColor colorWithRed:0.243 green:0.486 blue:0.969 alpha:1]; /*#3e7cf7*/
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
