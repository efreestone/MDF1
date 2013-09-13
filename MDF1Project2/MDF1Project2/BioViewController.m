//
//  BioViewController.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/12/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "BioViewController.h"

@interface BioViewController ()

@end

@implementation BioViewController

@synthesize nameLabel;
@synthesize bioTextview;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
