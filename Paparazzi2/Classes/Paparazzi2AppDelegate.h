//
//  Paparazzi2AppDelegate.h
//  Paparazzi2
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 7thGen Studio 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonListViewController.h"
#import "PhotoListViewController.h"

@interface Paparazzi2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    PersonListViewController *personsViewController;
    PhotoListViewController *recentsViewController;
    
    IBOutlet UITabBarController *tabMain;
    IBOutlet UINavigationController *naviPersons;
    IBOutlet UINavigationController *naviRecents;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

