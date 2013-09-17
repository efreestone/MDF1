// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  FirstViewController.m
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/14/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Nav bar edit example from SO from last week
    /*UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonSystemItemEdit target:self action:@selector(editList)];
     
     self.navigationItem.rightBarButtonItem = edit;*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
