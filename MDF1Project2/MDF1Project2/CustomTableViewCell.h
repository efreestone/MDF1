//
//  CustomTableViewCell.h
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/10/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UIViewController
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
