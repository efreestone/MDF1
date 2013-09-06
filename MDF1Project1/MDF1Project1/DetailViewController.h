// Elijah Freestone
// MDF1 1309
// Project 1
// September 2nd, 2013

//
//  DetailViewController.h
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/6/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    //Declare label for band name
    IBOutlet UILabel *bandLabel;
    //Declare label for album name
    IBOutlet UILabel *albumLabel;
    //Declare label for release date
    IBOutlet UILabel *releaseDateLabel;
    //Declare label for country of origin
    IBOutlet UILabel *countryLabel;
    //Declare home button
    IBOutlet UIButton *homeButton;
}

//Set property for band label to allow @synthesize
@property (strong) IBOutlet UILabel *bandLabel;
//Set property for album label to allow @synthesize
@property (strong) IBOutlet UILabel *albumLabel;
//Set property for date label to allow @synthesize
@property (strong) IBOutlet UILabel *releaseDateLabel;
//Set property for country label to allow @synthesize
@property (strong) IBOutlet UILabel *countryLabel;

//Declare IBAction for home button clicked
-(IBAction)onHome:(id)sender;



@end
