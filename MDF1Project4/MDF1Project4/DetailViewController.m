// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  DetailViewController.m
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/23/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

//Using synthesize for getter/setter
@synthesize bandNameLabel, locationLabel, songNameLabel, albumNameLabel, addedDateLabel;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
