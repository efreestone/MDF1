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
    //Declare locations array with all info
    NSMutableArray *locationsArray;
}

//Set property for array to allow synthesize
@property (nonatomic, strong) NSMutableArray *locationsArray;


//Declare static method
+(LocationManager *)GetInstance;

@end
