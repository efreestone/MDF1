// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  DetailViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    //From project 1 (modified)
    //These declarations are redundant because of the property declarations bellow. Keeping them for clarity
    //Declare cover image
    IBOutlet UIImageView *coverImage;
    //Declare title label
    IBOutlet UILabel *bandLabel;
    //Declare label for album name
    IBOutlet UILabel *albumLabel;
    //Declare label for release date
    IBOutlet UILabel *releaseDateLabel;
    //Declare label for country of origin
    IBOutlet UILabel *countryLabel;
}

//Set property for cover image to allow @synthesize
@property (strong) IBOutlet UIImageView *coverImage;
//Set property for title label to allow @synthesiz
@property (strong) IBOutlet UILabel *bandLabel;
//Set property for album label to allow @synthesize
@property (strong) IBOutlet UILabel *albumLabel;
//Set property for date label to allow @synthesize
@property (strong) IBOutlet UILabel *releaseDateLabel;
//Set property for country label to allow @synthesize
@property (strong) IBOutlet UILabel *countryLabel;

@end
