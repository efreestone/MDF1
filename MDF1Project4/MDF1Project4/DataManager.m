// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  DataManager.m
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/25/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
//Synthesize strings
@synthesize currentBandName, currentBandLocation, currentSongName, currentAlbumName, currentAddedDate;

//Initialize DataManager, instantiating and set properties to default values
-(id)init {
    self = [super init];
    if (self != nil) {
        [self setCurrentBandName:nil];
        [self setCurrentBandLocation:nil];
        [self setCurrentSongName:nil];
        [self setCurrentAlbumName:nil];
        [self setCurrentAddedDate:nil];
    }
    return self;
};

@end
