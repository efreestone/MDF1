// Elijah Freestone
// MDF1 1309
// Project 2
// September 9th, 2013

//
//  CustomTableViewCell.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/11/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//Synthesize cover, band and album labels for getter/setter to get access from ViewController.m
@synthesize coverImage;
@synthesize bandLabel;
@synthesize albumLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
