// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  MyMapAnnotation.m
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation

@synthesize title, coordinate;

-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord {
    if ((self = [super init])) {
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
