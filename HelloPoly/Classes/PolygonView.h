//
//  PolygonView.h
//
//  Created by Neo Lee on 6/5/10.
//  Copyright 2010 Ragnarok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "PolygonShape.h"

@interface PolygonView : UIView {
    IBOutlet PolygonShape *polygon;
    
    int dashedLine; // 0 - Solid, 1 - Dashed
    CGFloat rotation;
}
@property int dashedLine;

@end
