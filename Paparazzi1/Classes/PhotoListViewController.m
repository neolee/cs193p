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

@synthesize personName;

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
    
    if (personName != nil) {
        // Set images/labels via person mame
        [image1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ 1 Icon.jpg", personName]]];
        [image2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ 2 Icon.jpg", personName]]];
        [image3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ 3 Icon.jpg", personName]]];
        [image4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ 4 Icon.jpg", personName]]];
        [label1 setText:[NSString stringWithFormat:@"%@ 1", personName]];
        [label2 setText:[NSString stringWithFormat:@"%@ 2", personName]];
        [label3 setText:[NSString stringWithFormat:@"%@ 3", personName]];
        [label4 setText:[NSString stringWithFormat:@"%@ 4", personName]];

        [self setTitle:[NSString stringWithFormat:@"%@'s Photos", personName]];
    } else {
        // Set images/labels to some images
        [image1 setImage:[UIImage imageNamed:@"Katy Perry 1 Icon.jpg"]];
        [image2 setImage:[UIImage imageNamed:@"Katy Perry 2 Icon.jpg"]];
        [image3 setImage:[UIImage imageNamed:@"Katy Perry 3 Icon.jpg"]];
        [image4 setImage:[UIImage imageNamed:@"Taylor Swift 2 Icon.jpg"]];
        [label1 setText:@"Katy Perry 1"];
        [label2 setText:@"Katy Perry 2"];
        [label3 setText:@"Katy Perry 3"];
        [label4 setText:@"Taylor Swift 2"];

        [self setTitle:@"Recent Photos"];
    }
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
    [self viewPhoto:label1.text];
}

- (void) viewSecond:(id)sender {
    [self viewPhoto:label2.text];
}

- (void) viewThird:(id)sender {
    [self viewPhoto:label3.text];
}

- (void) viewFourth:(id)sender {
    [self viewPhoto:label4.text];
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
    [personName release];

    [image1 release];
    [image2 release];
    [image3 release];
    [image4 release];
    
    [label1 release];
    [label2 release];
    [label3 release];
    [label4 release];
    
    [super dealloc];
}


@end
