// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  SecondViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/9/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    //Declare Save Album button
    IBOutlet UIButton *saveButton;
    //Declare band name text field
    IBOutlet UITextField *bandNameField;
    //Decalre album title text field
    IBOutlet UITextField *albumTitleField;
    //Declare release date text field
    IBOutlet UITextField *releaseDateField;
    //Decalre country text field
    IBOutlet UITextField *countryField;
}

//Declare save button clicked. Only dismisses keyboard for now
-(IBAction)saveClicked:(id)sender;

@end
