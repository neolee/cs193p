//
//  Paparazzi2AppDelegate.m
//  Paparazzi2
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 7thGen Studio 2010. All rights reserved.
//

#import "Paparazzi2AppDelegate.h"

@implementation Paparazzi2AppDelegate

@synthesize window;


- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (void)populateCDStorage {
    context = [flickrFetcher managedObjectContext];
    NSLog(@"Database not initiated. Populated from the plist file.");
    
    // First we should read FakeData.plist into an array
    // Different operation needed to the installing and runnning phase
    NSString *rootPath = [self applicationDocumentsDirectory];
    NSLog(@"Root Path: %@", rootPath);
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"FakeData.plist"];
    
    NSFileManager *defaultFileManager = [NSFileManager defaultManager];
    BOOL installed = [defaultFileManager fileExistsAtPath:plistPath];

    NSArray *plistData;
    if (installed == NO) {
        NSLog(@"Not installed. Retrieve and copy FakeData.plist from main bundle.");
        
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"FakeData" ofType:@"plist"];
        plistData = [NSArray arrayWithContentsOfFile:bundlePath];
        
        if (plistData) {
            [plistData writeToFile:plistPath atomically:YES]; // Same as the line below
//            [defaultFile copyItemAtPath:bundlePath toPath:plistPath error:&errorDesc];
        }
    } else {
        plistData = [NSArray arrayWithContentsOfFile:plistPath];
    }

    // Now use an enumerator looping the array and fill contents into CoreData
    NSEnumerator *e = [plistData objectEnumerator];
    id obj = [e nextObject];
    
    NSMutableArray *personNames = [[NSMutableArray alloc] init];
    while (obj != nil) {
        Photo *photo = (Photo *)[NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
        [photo setName:[obj objectForKey:@"name"]];
        [photo setUrl:[obj objectForKey:@"path"]];
        NSLog(@"Photo added: %@", photo);
        
        // See if the person related already being operated
        NSString *personName = [obj objectForKey:@"user"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ IN %@", personName, personNames];
        BOOL existPerson = [predicate evaluateWithObject:obj];
        
        if (existPerson == NO) {
            Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
            [person setName:personName];
            [person addPhotosObject:photo];
            [photo setPerson:person];
            NSLog(@"Person added: %@", person);
            [personNames addObject:personName];
        } else {
            NSArray *persons = [flickrFetcher fetchManagedObjectsForEntity:@"Person" withPredicate:predicate];
            Person *person = [persons objectAtIndex:0];
            [photo setPerson:person];
        }

        obj = [e nextObject];
    }
    
    [personNames release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    flickrFetcher = [FlickrFetcher sharedInstance];
    
    if (![flickrFetcher databaseExists]) {
        [self populateCDStorage];
    } else {
        context = [flickrFetcher managedObjectContext];
    }

    [naviPersons setViewControllers:nil];
    personsViewController = [[PersonListViewController alloc] init];
    [naviPersons pushViewController:personsViewController animated:NO];
    
    [naviRecents setViewControllers:nil];
    recentsViewController = [[PhotoListViewController alloc] init];
    [recentsViewController setTitle:@"Recents"];
    [naviRecents pushViewController:recentsViewController animated:NO];
    
    [window addSubview:tabMain.view];
    
    [window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    if (flickrFetcher != nil) {
        if ([context hasChanges] == YES) {
            NSError *error = nil;
            
            BOOL saved = [context save:&error];
            NSLog(@"Saved? %@", (saved?@"YES":@"NO"));
            if (saved == NO) {
                NSLog(@"Fatal Error: %@, %@", error, [error userInfo]);
            }
        }
    }
}

- (void)dealloc {
    [flickrFetcher release];
    [context release];
    
    [personsViewController release];
    [recentsViewController release];
    
    [naviPersons release];
    [naviRecents release];
    [tabMain release];    
    [window release];
    
    [super dealloc];
}


@end
