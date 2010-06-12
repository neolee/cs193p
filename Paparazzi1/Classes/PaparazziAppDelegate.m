//
//  PaparazziAppDelegate.m
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 7thGen Studio 2010. All rights reserved.
//

#import "PaparazziAppDelegate.h"

@implementation PaparazziAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [naviContacts setViewControllers:nil];
    contactsViewController = [[PersonListViewController alloc] init];
    [contactsViewController setTitle:@"Contacts"];
    [naviContacts pushViewController:contactsViewController animated:NO];
    
    [naviRecents setViewControllers:nil];
    recentsViewController = [[PhotoListViewController alloc] init];
    [recentsViewController setTitle:@"Recents"];
    [naviRecents pushViewController:recentsViewController animated:NO];
    
    [window addSubview:tabMain.view];
    
    [window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
    [contactsViewController release];
    [recentsViewController release];
    
    [naviContacts release];
    [naviRecents release];
    [tabMain release];    
    [window release];
    [super dealloc];
}


@end
