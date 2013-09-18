// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  LocationManager.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/17/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationManager : NSObject
{
    //Declare name array
    NSMutableArray *namesArray;
    //Declare city and state array
    NSMutableArray *cityArray;
    //Declare lat and long array
    NSMutableArray *latLongArray;
}

//Set property for array to allow synthesize
@property (strong) NSMutableArray *namesArray;
@property (strong) NSMutableArray *cityArray;
@property (strong) NSMutableArray *latLongArray;

//Declare static method
+(LocationManager *)GetInstance;

//Declare Instance Method
-(void)getLocations;

@end
