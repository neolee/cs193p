//
//  PersonListViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonListViewController : UIViewController {
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
}
- (IBAction) viewFirst:(id)sender;
- (IBAction) viewSecond:(id)sender;
@end
