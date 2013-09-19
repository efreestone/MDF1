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
//@synthesize namesArray, cityArray, latLongArray;

//Synthesize my locations array for getter/setter
@synthesize locationsArray;


//Set static method for singleton instance
static LocationManager *_instance = nil;

//Create singleton instance
+(LocationManager *)GetInstance {
    @synchronized(self) {
        if (_instance == nil) {
            //Allocate and initialize singleton
            _instance = [[self alloc] init];
            //NSLog(@"From inside if _instance, GetInstance is getting hit");
        }
        return _instance;
    }
}

//Override default alloc
+(id)alloc {
    
    _instance = [super alloc];
    
    return _instance;
}

//Initialize singleton with NSArrays of location info
-(id)init {
    if (self = [super init]) {
        //Create mutable array with 10 NSDictionary objects to use objectForKey method. Although I have read about NSDictionary and dictionary objects a few times, this the first time I have actually tried to use them. Hoepfully I'm doing this correctly
        locationsArray = [[NSMutableArray alloc] initWithObjects:
                          @{@"Name":@"Freestone Music", @"City":@"Loveland, CO", @"Loc":@[@40.378664, @-105.072759]},
                          @{@"Name":@"Funky Munky Guitars", @"City":@"Austin, TX", @"Loc":@[@30.267153, @-97.743061]},
                          @{@"Name":@"Jam-It-Up", @"City":@"Tuscan, AZ", @"Loc":@[@32.221743, @-110.926479]},
                          @{@"Name":@"Indy Guitar Works", @"City":@"Indianapolis, IN", @"Loc":@[@39.768403, @-86.158068]},
                          @{@"Name":@"Rockstar Guitars", @"City":@"Los Angeles, CA", @"Loc":@[@34.052234, @-118.243685]},
                          @{@"Name":@"Big Apple Guitars", @"City":@"Brooklyn, NY", @"Loc":@[@40.650000, @-73.950000]},
                          @{@"Name":@"Windy City Music", @"City":@"Chicago, IL", @"Loc":@[@41.878114, @-87.629798]},
                          @{@"Name":@"Desert Sound, Inc", @"City":@"Las Vegas, NV", @"Loc":@[@36.114646, @-115.172816]},
                          @{@"Name":@"Acoustic Unlimited", @"City":@"Portland, OR", @"Loc":@[@45.523452, @-122.676207]},
                          @{@"Name":@"Motor City Music", @"City":@"Detroit, MI", @"Loc":@[@42.331427, @-83.045754]},
                          nil];
    }
    return self;
}

@end
