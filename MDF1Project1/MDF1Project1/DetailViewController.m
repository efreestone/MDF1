// Elijah Freestone
// MDF1 1309
// Project 1
// September 2nd, 2013

//
//  DetailViewController.m
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/6/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

//Synthesize all 4 labels for getter/setter to get access from ViewController.m
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onHome:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
