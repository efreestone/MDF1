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
    
    //Declare string that will hold raw data from xml
    NSString *passedRawData;
}

@property (nonatomic, strong) IBOutlet UITextView *textView;

@end
