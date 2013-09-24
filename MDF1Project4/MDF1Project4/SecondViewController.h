// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  SecondViewController.h
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/21/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    //Declare text view
    IBOutlet UITextView *textView;
    
    //Declare nav bar. Only used to keep design consistant. Will not have any buttons for navigation
    IBOutlet UINavigationBar *navBar;
}

@end
