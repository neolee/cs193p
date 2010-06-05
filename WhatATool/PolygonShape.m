//
//  PolygonShape.m
//  WhatATool
//
//  Created by Neo Lee on 6/3/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides, minimumNumberOfSides, maximumNumberOfSides;

static NSDictionary *PolygonNames;

+(void) initialize {
    if (!PolygonNames) {
        PolygonNames = [NSDictionary dictionaryWithObjectsAndKeys:@"triangle", @"3", 
                        @"square", @"4", @"pentagon", @"5", @"hexagon", @"6", @"heptagon", @"7", 
                        @"octagon", @"8", @"enneagon", @"9", @"decagon", @"10", 
                        @"hendecagon", @"11", @"dodecagon", @"12", nil];
    }
}

- (void)setNumberOfSides:(int)value {
    if (value == numberOfSides) return;
    
    if (value < minimumNumberOfSides) {
        NSLog(@"WARNING[PolygonShape]: Invalid number of sides: %d is smaller than the minimum of %d allowed.", value, minimumNumberOfSides);
    } else if (value > maximumNumberOfSides) {
        NSLog(@"WARNING[PolygonShape]: Invalid number of sides: %d is greater than the maximum of %d allowed.", value, maximumNumberOfSides);
    } else {
        numberOfSides = value;
    }
}

- (void)setMinimumNumberOfSides:(int)value {
    if (value == minimumNumberOfSides) return; 

    const int MIN = 3;
    if (value < MIN) {
        NSLog(@"WARNING[PolygonShape]: Invalid minimum number of sides: %d is smaller than the minimum of %d allowed.", value, MIN);
    } else {
        minimumNumberOfSides = value;
    }
}

- (void)setMaximumNumberOfSides:(int)value {
    if (value == maximumNumberOfSides) return; 
    
    const int MAX = 12;
    if (value > MAX) {
        NSLog(@"Invalid maximum number of sides: %d is greater than the maximum of %d allowed.", value, MAX);
    } else {
        maximumNumberOfSides = value;
    }
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    [super init];
    
    self.minimumNumberOfSides = min;
    self.maximumNumberOfSides = max;
    self.numberOfSides = sides;
    
    return self;
}

- (id) init {
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (float)angleInDegrees {
    return 180.0 - 360.0 / numberOfSides;
}

- (float)angleInRadians {
    return self.angleInDegrees * M_PI / 180;
}

- (NSString *)name {
    return [PolygonNames objectForKey:[NSString stringWithFormat:@"%d", numberOfSides]];
}

- (NSString *)description {
    return [NSString stringWithFormat:
            @"Hello I am a %d-sided polygon (aka a %@) with angles of %.f degrees (%f radians).",
            numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

- (void)dealloc {
    NSLog(@"INFO[PolygonShape]: An object dealloc-ed.");
    
    [super dealloc];
}

@end
