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
//Import Data Manager
#import "DataManager.h"

@interface SecondViewController : UIViewController
{
    //Declare text view
    IBOutlet UITextView *textView;
    IBOutlet UIScrollView *scrollView;
    
    NSString *passedRawData;
    
    //Declare instance of data manager
    DataManager *dataManager;
}

@property (nonatomic, strong) IBOutlet UITextView *textView;

@end
