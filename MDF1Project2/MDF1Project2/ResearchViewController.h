//
//  ResearchViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/12/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResearchViewController : UIViewController
{
    //Declare label for author name
    IBOutlet UILabel *researchTitle;
    //Declare scroll view for article abstract
    IBOutlet UITextView *abstractTextview;
    //Declare label for article source
    IBOutlet UILabel *articleSource;
    //Declare label for link
    IBOutlet UILabel *linkLabel;
}

@property (strong) IBOutlet UILabel *researchTitle;
@property (strong) IBOutlet UITextView *abstractTextview;
@property (strong) IBOutlet UILabel *articleSource;
@property (strong) IBOutlet UILabel *linkLabel;

@end
