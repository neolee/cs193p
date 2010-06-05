//
//  PolygonShape.h
//  WhatATool
//
//  Created by Neo Lee on 6/3/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PolygonShape : NSObject {
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

@end
