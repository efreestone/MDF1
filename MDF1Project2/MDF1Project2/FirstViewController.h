// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  FirstViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    //Declare home screen button w/ image. Whole image (all blue) is a button
    IBOutlet UIButton *albumButton;
}

//Declare IBAction to grab tap of home screen
-(IBAction)onTap:(id)sender;

@end
