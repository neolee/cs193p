//
//  PhotoListViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"
#import "Person.h"
#import "Photo.h"
#import "PhotoDetailViewController.h"


@interface PhotoListViewController : UITableViewController {
    NSManagedObjectContext *context;
    NSFetchedResultsController *fetchedResultsController;
    Person *person;
    
    PhotoDetailViewController *photoDetailViewController;
}
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Person *person;
@end
