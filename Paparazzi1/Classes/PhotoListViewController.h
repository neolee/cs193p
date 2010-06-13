//
//  PhotoListViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoListViewController : UIViewController {
    NSString *personName;

    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
    IBOutlet UIImageView *image4;
    
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
}
@property (nonatomic, copy) NSString *personName;

- (IBAction) viewFirst:(id)sender;
- (IBAction) viewSecond:(id)sender;
- (IBAction) viewThird:(id)sender;
- (IBAction) viewFourth:(id)sender;
@end
