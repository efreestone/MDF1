// Elijah Freestone
// MDF1 1309
// Project 1
// September 2nd, 2013

//
//  ViewController.m
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/2/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //Create editable NSMutableArray with 20 band names
    bandArray = [[NSMutableArray alloc] initWithObjects:@"Amaranthe", @"Amaranthe", @"All That Remains", @"Killswitch Engage", @"Killswitch Engage", @"Killswitch Engage", @"Disarmonia Mundi", @"Disarmonia Mundi", @"Shinedown", @"Shinedown", @"Shinedown", @"Shinedown", @"Soilwork", @"Soilwork", @"Soilwork", @"Soilwork", @"Battlecross", @"Battlecross", @"Allegaeon", @"Diecast", nil];
    
    //Create editable NSMutableArray with 20 Album titles
    albumArray = [[NSMutableArray alloc] initWithObjects:@"Amaranthe", @"The Nexus", @"The Fall of Ideals", @"The End of Heartache", @"As Daylight Dies", @"Disarm the Descent", @"Fragments of D-Generation", @"Mind Tricks", @"Leave a Whisper", @"Us and Them", @"The Sound of Madness", @"Amarylis", @"Stabbing the Drama", @"Sworn to a Great Divide", @"The Panic Broadcast", @"The Living Infinite", @"Pursuit of Honor", @"War of Will", @"Fragments of Form and Function", @"Internal Revolution", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Built in function to set number of sections
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    } else if (section == 1) {
        return 5;
    } else if (section == 2) {
        return 5;
    } else if (section == 3) {
        return 5;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

//Built in function to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger actualRow = 0;
    
    actualRow = (indexPath.section * 5) + indexPath.row;
    
    //if (indexPath.section == 0) {
        cell.textLabel.text = (NSMutableString *)[albumArray objectAtIndex:actualRow];
    //} else if (indexPath.section == 1) {
        //cell.textLabel.text = (NSMutableString *)[albumArray objectAtIndex:indexPath.row];
    //}
    
    
    return cell;
}

@end
