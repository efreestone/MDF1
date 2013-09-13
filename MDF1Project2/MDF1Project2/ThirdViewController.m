// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  ThirdViewController.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Other", @"Other");
        //Set icon to star. Not sure what else to use for "Other"
        self.tabBarItem.image = [UIImage imageNamed:@"other"];
    }
    return self;
}

- (void)viewDidLoad
{
    //Set background color to blue from splash and icons
    self.view.backgroundColor = [UIColor colorWithRed:0.243 green:0.486 blue:0.969 alpha:1]; /*#3e7cf7*/
    
    tableView.backgroundColor = [UIColor colorWithRed:0.243 green:0.486 blue:0.969 alpha:1]; /*#3e7cf7*/
    
    researchTitleArray = [[NSArray alloc] initWithObjects:@"Test 1", @"Test 2", @"Test 3", @"Test 4", nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//From Project 1
//Built in function to set number of rows in table view section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [researchTitleArray count];
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

//From Project 1
//Built in function to set number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//From Project 1 videos
//Built in function to allocate and reuse table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger actualRow = 0;
    //Check which section index path falls in (*2 because first section has 2 items)
    actualRow = (indexPath.section * 2) + indexPath.row;

    cell.textLabel.text = (NSString *)[researchTitleArray objectAtIndex:actualRow];
    
    return cell;
}




@end
