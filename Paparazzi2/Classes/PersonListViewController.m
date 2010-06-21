//
//  PersonListViewController.m
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import "PersonListViewController.h"
#import "PhotoListViewController.h"


@implementation PersonListViewController

@synthesize context;


#pragma mark -
#pragma mark View lifecycle

// The designated initializer. Override if you create the controller programmatically and 
// want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
        FlickrFetcher *flickrFetcher = [FlickrFetcher sharedInstance];
        context = [flickrFetcher managedObjectContext];
        // We don't use the pre-defined method(as below) in FlickrFetcher for our practising
        // fetchedResultsController = [flickrFetcher fetchManagedObjectsForEntity:@"Person" withPredicate:nil];
        
        NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
        [request setEntity:entity];
        
        // A Predicate is not required but a sort descriptor is, 
        // or the results will be un-ordered by default.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        
        [request setSortDescriptors:sortDescriptors];
        [request setFetchBatchSize:FETCH_BATCH_SIZE];
        [sortDescriptors release];
        
        fetchedResultsController = [[NSFetchedResultsController alloc] 
                                    initWithFetchRequest:request 
                                    managedObjectContext:context
                                    sectionNameKeyPath:nil
                                    cacheName:@"tempPerson"];
        
        [request release];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self setTitle:@"Persons"];
    
	NSError *error;
	[fetchedResultsController performFetch:&error];
}


#pragma mark -
#pragma mark Table view data source

// Ref: http://developer.apple.com/iphone/library/documentation/CoreData/Reference/NSFetchedResultsController_Class/Reference/Reference.html

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger size = [[fetchedResultsController sections] count];
    
    if (size == 0) {
        size = 1;
    }
    
    return size;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = [fetchedResultsController sections];
    NSInteger count = 0;
    
    if ([sections count]) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
        count = [sectionInfo numberOfObjects];
    }

    return count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up cell
    Person *person = [fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [person name];
    NSSet *photos = [person photos];
    
    // If want to select a image for the person just enumerating them
//    NSEnumerator *e = [photos objectEnumerator];
//    Photo *photo = [e nextObject];
//    while (photo != nil) {
//        photo = [e nextObject];
//    }

    // But we just pick up rondom photo for good
    Photo *photo = [photos anyObject];
    cell.imageView.image = [UIImage imageNamed:[photo url]];
    [photo release];
    
    return [cell autorelease];
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    photoListViewController = [[PhotoListViewController alloc] initWithStyle:UITableViewStylePlain];
    Person *person = [fetchedResultsController objectAtIndexPath:indexPath];
    
    [photoListViewController setPerson:person];
    [photoListViewController setTitle:[[person name] stringByAppendingString:@"'s Photos"]];
    
    [self.navigationController pushViewController:photoListViewController animated:YES];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [context release];
    [fetchedResultsController release];
    
    [super dealloc];
}


@end
