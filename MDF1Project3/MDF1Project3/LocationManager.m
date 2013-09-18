// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  LocationManager.m
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/17/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

//Synthesize arrays for getter/setter methods
@synthesize namesArray, cityArray, latLongArray;

//Set static method for singleton instance
static LocationManager *_instance = nil;

//Create singleton instance
+(LocationManager *)GetInstance {
    if (_instance != nil) {
        //Allocate and initialize singleton
        _instance = [[self alloc] init];
    }
    return _instance;
}

//Override default alloc
+(id)alloc {
    
    _instance = [super alloc];
    
    return _instance;
}

//Initialize singleton with NSArrays of location info
-(id)init {
    if (self = [super init]) {
        //Create names array
        self.namesArray = [[NSMutableArray alloc] initWithObjects:@"Freestone Music", @"Funky Munky Guitars", @"Jam-It-Up", @"Indy Guitar Works", @"Rockstar Guitars", @"Big Apple Guitars", @"Windy City Music", @"Desert Sound", @"Acoustic Unlimited", @"Motor City Music", nil];
        //Create city and state array
        self.cityArray = [[NSMutableArray alloc] initWithObjects:@"Loveland, CO", @"Austin, TX", @"Tuscan, AZ", @"Indianapolis, IN", @"Los Angeles, CA", @"Brooklyn, NY", @"Chicago, IL", @"Las Vegas, NV", @"Portland, OR", @"Detroit, MI", nil];
        //Create lat and long array
        self.latLongArray = [[NSMutableArray alloc] initWithObjects:@"lat: 40.397761, long: -105.074980", @"lat: 30.267153, long: -97.743061", @"lat: 32.221743, long: -110.926479", @"lat: 39.768403, long: -86.158068", @"lat: 34.052234, long: -118.243685", @"lat: 40.650000, long: -73.950000", @"lat: 41.878114, long: -87.629798", @"lat: 36.114646, long: -115.172816", @"lat: 45.523452, long: -122.676207", @"lat: 42.331427, long: -83.045754", nil];
    }
    return self;
}

//Instance method to give both views access to singleton
-(void)getLocations {
    //Create names array
    namesArray = [[NSMutableArray alloc] initWithObjects:@"Freestone Music", @"Funky Munky Guitars", @"Jam-It-Up", @"Indy Guitar Works", @"Rockstar Guitars", @"Big Apple Guitars", @"Windy City Music", @"Desert Sound", @"Acoustic Unlimited", @"Motor City Music", nil];
    //Create city and state array
    cityArray = [[NSMutableArray alloc] initWithObjects:@"Loveland, CO", @"Austin, TX", @"Tuscan, AZ", @"Indianapolis, IN", @"Los Angeles, CA", @"Brooklyn, NY", @"Chicago, IL", @"Las Vegas, NV", @"Portland, OR", @"Detroit, MI", nil];
    //Create lat and long array
    latLongArray = [[NSMutableArray alloc] initWithObjects:@"lat: 40.397761, long: -105.074980", @"lat: 30.267153, long: -97.743061", @"lat: 32.221743, long: -110.926479", @"lat: 39.768403, long: -86.158068", @"lat: 34.052234, long: -118.243685", @"lat: 40.650000, long: -73.950000", @"lat: 41.878114, long: -87.629798", @"lat: 36.114646, long: -115.172816", @"lat: 45.523452, long: -122.676207", @"lat: 42.331427, long: -83.045754", nil];
}




@end
