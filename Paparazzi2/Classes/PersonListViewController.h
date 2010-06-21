//
//  PersonListViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrFetcher.h"
#import "Person.h"
#import "Photo.h"
#import "PhotoListViewController.h"


@interface PersonListViewController : UITableViewController {
    NSManagedObjectContext *context;
    NSFetchedResultsController *fetchedResultsController;
    
    PhotoListViewController *photoListViewController;
}
@property (nonatomic, retain) NSManagedObjectContext *context;
@end
