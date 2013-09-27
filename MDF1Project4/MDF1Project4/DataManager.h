// Elijah Freestone
// MDF1 1309
// Project 4
// September 21st, 2013

//
//  DataManager.h
//  MDF1Project4
//
//  Created by Elijah Freestone on 9/25/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    //Declare band name string
    NSString *currentBandName;
    //Declare band location string
    NSString *currentBandLocation;
    //Declare song name string
    NSString *currentSongName;
    //Declare album name string
    NSString *currentAlbumName;
    //Declare date string
    NSString *currentAddedDate;
    //Declare string to hold raw xml data
    NSString *rawDataString;
}

//Useing properties for getter/setter
@property (nonatomic, strong) NSString *currentBandName;
@property (nonatomic, strong) NSString *currentBandLocation;
@property (nonatomic, strong) NSString *currentSongName;
@property (nonatomic, strong) NSString *currentAlbumName;
@property (nonatomic, strong) NSString *currentAddedDate;
@property (nonatomic, strong) NSString *rawDataString;

@end
