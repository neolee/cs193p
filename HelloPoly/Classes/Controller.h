//
//  Controller.h
//
//  Created by Neo Lee on 6/4/10.
//  Copyright 2010 Ragnarok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet PolygonView *polygonView;
    IBOutlet UISlider *slider;
    IBOutlet UISegmentedControl *segLine;
    
    IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)segLineValueChanged:(id)sender;
@end
