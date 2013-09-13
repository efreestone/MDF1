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
//Import research view
#import "ResearchViewController.h"

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
    
    //Override background color between groups in table view with my blue
    tableView.backgroundColor = [UIColor colorWithRed:0.243 green:0.486 blue:0.969 alpha:1]; /*#3e7cf7*/
    
    //Create array of titles
    researchTitleArray = [[NSArray alloc] initWithObjects:@"The iPhone. Isn't Easy.", @"Android in opposition to iPhone.", @"Bio of the student", nil];
    
    //Create array with author names
    authorArray = [[NSArray alloc] initWithObjects:@"Thompson, Tom", @"Sharma, Kavita", nil];
    
    //Create array with article abstracts
    abstractArray = [[NSArray alloc] initWithObjects:@"The article presents the author's insights on the development of iPhone of Apple Computer Inc. The author says that Floyd was driven by enthusiasm which turned to exasperation as iPhone platform can be an intimidating process. He states that the key to the screen of iPhone is called Cocoa Touch's View Class which displays information and handles user actions. He adds that Cocoa Touch has the agility and features to write applications with small amount of codes.", @"The paper is an analysis and comparison of the android mobile OS with the iPhone which have ruled the mobile market in past years today is facing a downfall just because of the introduction of this new OS. Android with its new and extraordinary features is being loved by all and is promising various amendments and introduction of newer applications to give the best to its users.Paper also highlights some of the imperative features that makes android better than the iPhone. Comparison is done on the basis of their platform, their performances and the growth in mobile land. Special attention is given to the role of user s to co-constructing the platform.", nil];
    
    //Create array with source of articles
    sourceArray = [[NSArray alloc] initWithObjects:@"Informationweek. 3/29/2010, Issue 1261, p45-48. 4p.", @"International Journal on Computer Science & Engineering. 2011, Vol. 3 Issue 5, p1965-1969. 5p. 1 Diagram.", nil];
    
    //Create array with links to articles
    linksArray = [[NSArray alloc] initWithObjects:@"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=a9h&AN=49070810&site=ehost-live", @"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=a9h&AN=69620840&site=ehost-live", nil];
    
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
        //First section has 2 cells
        return 2;
    } else if (section == 1) {
        //Second section only has 1
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

//From Project 1 (modified)
//Built in function to grab row selected in table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Section = %d Row = %d", indexPath.section, indexPath.row); //, [researchTitleArray objectAtIndex:indexPath.row]
    
    ResearchViewController *researchViewController = [[ResearchViewController alloc] initWithNibName:@"ResearchView" bundle:nil];
    if (indexPath.section == 0) {
        if (researchViewController != nil) {
            //Push research view on top
            [self.navigationController pushViewController:researchViewController animated:true];
            //Set title of nav bar to authors name
            researchViewController.title = [authorArray objectAtIndex:indexPath.row];
            //Set author name label on research view
            researchViewController.researchTitle.text = [NSString stringWithFormat:@"Title: %@",[researchTitleArray objectAtIndex:indexPath.row]];
            //Set abstract to text view
            researchViewController.abstractTextview.text = [NSString stringWithFormat:@"Abstract: %@",[abstractArray objectAtIndex:indexPath.row]];
            //Set source to source label
            researchViewController.articleSource.text = [NSString stringWithFormat:@"Source: %@",[sourceArray objectAtIndex:indexPath.row]];
            //Set link to link label
            researchViewController.linkLabel.text = [NSString stringWithFormat:@"Link: %@",[linksArray objectAtIndex:indexPath.row]];
        }
    }
    
    //Allocate detail view controller
    /*DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    if (detailViewController != nil) {
        //Push detail view on top of albums view (not from project 1)
        [self.navigationController pushViewController:detailViewController animated:true];
        
        //Using cover arrays to apply images but keeping this for now as it may come in handy when my CRUD is fully operating  for adding cover image name to an array
        //Cast album name into NSString (not from Project 1)
        //NSString *albumSelected2 = [albumArray objectAtIndex:indexPath.row];
        //Replace space with - (not from Project 1)
        //NSString *albumNameNoSpaces2 = [albumSelected2 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        //Add -Large.png to end of modified album name (not from Project 1)
        //NSString *albumNameWithPng2 = [albumNameNoSpaces2 stringByAppendingString:@"-Large.png"];
        
        //Apply cover image to custom cell (not from Project 1)
        //detailViewController.coverImage.image = [UIImage imageNamed:albumNameWithPng2];
        detailViewController.coverImage.image = [UIImage imageNamed:[coverArrayLarge objectAtIndex:indexPath.row]];
        //Change navbar title of detail view to band name (modified from project 1)
        detailViewController.title = (NSString *)[bandArray objectAtIndex:indexPath.row];
        //Add band name to first label on detail view
        detailViewController.bandLabel.text = [NSString stringWithFormat:@"Band Name: %@", [bandArray objectAtIndex:indexPath.row]];
        //Add album name to second label on detail view
        detailViewController.albumLabel.text = [NSString stringWithFormat:@"Album Name: %@", [albumArray objectAtIndex:indexPath.row]];
        //Add release date to third label on detail view
        detailViewController.releaseDateLabel.text = [NSString stringWithFormat:@"Year Released: %@", [releaseDateArray objectAtIndex:indexPath.row]];
        //Add country of origin to fourth label on detail view
        detailViewController.countryLabel.text = [NSString stringWithFormat:@"Country of Origin: %@", [countryArray objectAtIndex:indexPath.row]];
    }*/
}





@end
