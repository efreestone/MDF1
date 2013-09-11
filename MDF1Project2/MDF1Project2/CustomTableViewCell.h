// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  CustomTableViewCell.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    //These declarations are redundant because of the property declarations bellow. Keeping them for clarity
    //Declare label for band name
    IBOutlet UILabel *bandLabel;
    //Declare label for album name
    IBOutlet UILabel *albumLabel;
}

//Set property for band label to allow @synthesize
@property (strong) IBOutlet UILabel *bandLabel;
//Set property for album label to allow @synthesize
@property (strong) IBOutlet UILabel *albumLabel;

@end
