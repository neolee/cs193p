//
//  Paparazzi2AppDelegate.h
//  Paparazzi2
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 7thGen Studio 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"
#import "Person.h"
#import "Photo.h"
#import "PersonListViewController.h"
#import "PhotoListViewController.h"

@interface Paparazzi2AppDelegate : NSObject <UIApplicationDelegate> {
    FlickrFetcher *flickrFetcher;
    NSManagedObjectContext *context;
    
    UIWindow *window;
    
    PersonListViewController *personsViewController;
    PhotoListViewController *recentsViewController;
    
    IBOutlet UITabBarController *tabMain;
    IBOutlet UINavigationController *naviPersons;
    IBOutlet UINavigationController *naviRecents;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;

- (NSString *)applicationDocumentsDirectory;
- (void)populateCDStorage;
@end

