// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  DetailViewController.h
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/23/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    //Declare band name label
    IBOutlet UILabel *bandNameLabel;
    //Declare band location label
    IBOutlet UILabel *locationLabel;
    //Declare song name label
    IBOutlet UILabel *songNameLabel;
    //Declare slbum name label
    IBOutlet UILabel *albumNameLabel;
    //Declare added date label
    IBOutlet UILabel *addedDateLabel;
    
}

//Use properties for synthesize to get getters/setters
@property (strong) IBOutlet UILabel *bandNameLabel;
@property (strong) IBOutlet UILabel *locationLabel;
@property (strong) IBOutlet UILabel *songNameLabel;
@property (strong) IBOutlet UILabel *albumNameLabel;
@property (strong) IBOutlet UILabel *addedDateLabel;


@end
