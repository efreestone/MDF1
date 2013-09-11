//
//  CustomTableViewCell.m
//  MDF1Project2
//
//  Created by Elijah Freestone on 9/11/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//Synthesize band and album labels for getter/setter to get access from ViewController.m
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
