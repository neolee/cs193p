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

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) viewPhotos:(NSString *)name {
    if (name == nil) {
        return;
    }
    
    PhotoListViewController *photoListViewController = [[PhotoListViewController alloc] init];
    photoListViewController.personName = name;
    
    [[self navigationController] pushViewController:photoListViewController animated:YES];
    
    [photoListViewController release];
}

- (void) viewFirst:(id)sender {
    [self viewPhotos:label1.text];
}

- (void) viewSecond:(id)sender {
    [self viewPhotos:label2.text];
}

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
    [label1 release];
    [label2 release];
    
    [super dealloc];
}


@end
