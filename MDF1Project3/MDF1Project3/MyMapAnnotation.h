// Elijah Freestone
// MDF1 1309
// Project 3
// September 14th, 2013

//
//  MyMapAnnotation.h
//  MDF1Project3
//
//  Created by Elijah Freestone on 9/19/13.
//  Copyright (c) 2013 Elijah Freestone. All rights reserved.
//

#import <Foundation/Foundation.h>
//Import map kit
#import <MapKit/MapKit.h>

@interface MyMapAnnotation : NSObject <MKAnnotation>
{
    //Declare title string
    NSString *title;
    //Declare cooridate
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString *title;
//Read only to stop any attempt to set/change coordinate from outside custom init method
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//Declare custom init method
-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord;

@end
