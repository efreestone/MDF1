//
//  BioViewController.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/12/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BioViewController : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UITextView *bioTextview;
}

@property (strong) IBOutlet UILabel *nameLabel;
@property (strong) IBOutlet UITextView *bioTextview;

@end
