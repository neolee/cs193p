//
//  Controller.m
//
//  Created by Neo Lee on 6/4/10.
//  Copyright 2010 Ragnarok. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (void)loadPrefs {
    int n = [[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfSides"];
    if (n) polygon.numberOfSides = n;
    
    polygonView.dashedLine = [[NSUserDefaults standardUserDefaults] integerForKey:@"dashedLine"];
}

- (void)savePrefs {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:polygon.numberOfSides]
                                             forKey:@"numberOfSides"];
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:polygonView.dashedLine]
                                             forKey:@"dashedLine"];    
}

- (void)updateUI {
    decreaseButton.enabled = (polygon.numberOfSides != polygon.minimumNumberOfSides);
    increaseButton.enabled = (polygon.numberOfSides != polygon.maximumNumberOfSides);
    
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
    
    slider.minimumValue = polygon.minimumNumberOfSides;
    slider.maximumValue = polygon.maximumNumberOfSides;
    slider.value = polygon.numberOfSides;
    
    [polygonView setNeedsDisplay];
}

- (void)awakeFromNib {
    [self loadPrefs];
    
    polygon.minimumNumberOfSides = 3;
    polygon.maximumNumberOfSides = 12;
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
    segLine.selectedSegmentIndex = polygonView.dashedLine;

    [self updateUI];
}

- (IBAction)decrease:(id)sender {
    polygon.numberOfSides--;
    [self savePrefs];
    [self updateUI];
}

- (IBAction)increase:(id)sender {
    polygon.numberOfSides++;
    [self savePrefs];
    [self updateUI];
}

- (IBAction)sliderValueChanged:(id)sender {
    polygon.numberOfSides = slider.value;
    [self savePrefs];
    [self updateUI];
}

- (IBAction)segLineValueChanged:(id)sender {
    polygonView.dashedLine = segLine.selectedSegmentIndex;
    [self savePrefs];
    [self updateUI];
}

@end
