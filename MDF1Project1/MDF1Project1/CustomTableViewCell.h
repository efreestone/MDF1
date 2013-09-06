//
//  CustomTableViewCell.h
//  MDF1Project1
//
//  Created by Elijah Freestone on 9/6/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    //Declare label for band name
    IBOutlet UILabel *bandLabel;
    //Declare label for album name
    IBOutlet UILabel *albumLabel;
}

@property (strong) IBOutlet UILabel *bandLabel;

@property (strong) IBOutlet UILabel *albumLabel;

@end
