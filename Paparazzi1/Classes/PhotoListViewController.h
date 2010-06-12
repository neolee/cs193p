//
//  PhotoListViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoListViewController : UIViewController {
    NSString *contactName;
    
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
}
@property (nonatomic, copy) NSString *contactName;

- (IBAction) viewFirst:(id)sender;
- (IBAction) viewSecond:(id)sender;
- (IBAction) viewThird:(id)sender;
@end
