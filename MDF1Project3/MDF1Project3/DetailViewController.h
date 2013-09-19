// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  DetailViewController.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/16/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    //Declare location name label
    IBOutlet UILabel *nameLabel;
    //Declare location city/state label
    IBOutlet UILabel *cityLabel;
    //Declare lat/long label
    IBOutlet UILabel *latLongLabel;
}

//Create property to use synthesize for getter/setter
@property (strong) IBOutlet UILabel *nameLabel;
@property (strong) IBOutlet UILabel *cityLabel;
@property (strong) IBOutlet UILabel *latLongLabel;

@end
