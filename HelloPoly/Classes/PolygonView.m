//
//  PolygonView.m
//
//  Created by Neo Lee on 6/5/10.
//  Copyright 2010 Ragnarok. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

@synthesize dashedLine;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
        dashedLine = FALSE;
        rotation = 0.0;
    }
    
    return self;
}


- (NSArray *)polygonNodesInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
    // Make some vertical offset via the polygon title label
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0 + 18);
    
    // The start point are different between even and odd numberOfSides
    if (numberOfSides % 2 != 0) {
        center.y = center.y * (1.0 + .1 * ((12.0 - (float)numberOfSides) / 12.0));
    }

    float radius = 0.7 * center.x; // Let some whitespace outside the polygon
    
    NSMutableArray *result = [NSMutableArray array];
    
    float angle = (2.0 * M_PI) / numberOfSides;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
        float newAngle = (angle * currentAngle) - rotationDelta + rotation; // In response to user rotation
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
    }

    return result;
}

- (void)drawBackground:(CGContextRef)context bounds:(CGRect)bounds {
    // Normal
    //    [[UIColor lightGrayColor] set];
    //    UIRectFill(bounds);
    
    // Gradient using CA layers, for it to work should add QuartzCore framework and
    // import <QuartzCore/QuartzCore.h> as well
    // TODO: Why it will hide the polygon?
    //    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //    gradientLayer.frame = bounds;
    //    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor lightGrayColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    //    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    // Gradient using CG
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.0, 0.0, 0.0, 0.35,  // Start color
        0.7, 0.7, 0.7, 0.06 }; // End color
    
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    
    CGPoint topCenter = CGPointMake(CGRectGetMidX(bounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGContextDrawLinearGradient(context, glossGradient, topCenter, midCenter, 0);
    
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace); 
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect bounds = [self bounds];
    
    // Draw polygon name label
    CGRect frame = CGRectMake(10, 10, 260, 26);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [self addSubview:label];
    [label setText:[polygon.name capitalizedString]];
    [label setTextAlignment:UITextAlignmentCenter];
    [label release];
    
    // Draw background
    [self drawBackground:context bounds:bounds];

    // Draw polygon
    [[UIColor blueColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    if (dashedLine) {
        CGFloat pattern[] = {5.0, 5.0};
        CGContextSetLineDash(context, 0.0, pattern, sizeof(pattern)/sizeof(pattern[0]));
    }
    
    NSArray *pts = [self polygonNodesInRect:bounds numberOfSides:polygon.numberOfSides];

    CGContextBeginPath (context);
    
    NSValue *v = [pts objectAtIndex:0];
    CGPoint pt = [v CGPointValue];
    CGContextMoveToPoint (context, pt.x, pt.y);
    for (int i = 1; i < polygon.numberOfSides; i++) {
        v = [pts objectAtIndex:i];
        pt = [v CGPointValue];
        CGContextAddLineToPoint (context, pt.x, pt.y);
    }
    v = [pts objectAtIndex:0];
    pt = [v CGPointValue];
    CGContextAddLineToPoint(context, pt.x, pt.y);

    CGContextDrawPath (context, kCGPathFillStroke);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p1 = [touch previousLocationInView:self];
    CGPoint p2 = [touch locationInView:self];

    p1.x = p1.x - self.bounds.size.width/2;
    p1.y = p1.y - self.bounds.size.height/2;
    p2.x = p2.x - self.bounds.size.width/2;
    p2.y = p2.y - self.bounds.size.height/2;

    CGFloat theta1 = atan2f(p1.y, p1.x);
    CGFloat theta2 = atan2f(p2.y, p2.x);
    CGFloat delta = theta2 - theta1;

    rotation = rotation + delta;

    [self setNeedsDisplay];
}

@end
