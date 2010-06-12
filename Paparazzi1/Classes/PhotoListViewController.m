//
//  PhotoListViewController.m
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoDetailViewController.h"


@implementation PhotoListViewController

@synthesize contactName;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *viewTitle;
    if (contactName != nil) {
        viewTitle = [NSString stringWithFormat:@"%@'s Photos", contactName]; 
    } else {
        viewTitle = @"Recent Photos";
    }

    [self setTitle:viewTitle];
    
    [viewTitle release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) viewPhoto:(NSString *)name {
    if (name == nil) {
        return;
    }
    
    PhotoDetailViewController *photoDetailViewController = [[PhotoDetailViewController alloc] init];
    photoDetailViewController.photoName = name;
    photoDetailViewController.photoTitle = name;
    
    [[self navigationController] pushViewController:photoDetailViewController animated:YES];
    
    [photoDetailViewController release];
}

- (void) viewFirst:(id)sender {
    [self viewPhoto:@"Photo 1"];
}

- (void) viewSecond:(id)sender {
    [self viewPhoto:@"Photo 2"];
}

- (void) viewThird:(id)sender {
    [self viewPhoto:@"Photo 3"];
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
    [contactName release];
    
    [label1 release];
    [label2 release];
    [label3 release];
    
    [super dealloc];
}


@end
