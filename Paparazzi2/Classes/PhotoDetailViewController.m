//
//  PhotoDetailViewController.m
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import "PhotoDetailViewController.h"


@implementation PhotoDetailViewController

@synthesize photoName, photoTitle;

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
    
    [self setTitle:photoTitle];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", photoName]];
    [imageView setImage:image];

//    [scrollView setContentSize:CGSizeMake(imageView.frame.size.width, imageView.frame.size.height)];
    [scrollView setMaximumZoomScale:5.0];
    [scrollView setMinimumZoomScale:0.2];
    [scrollView setAutoresizesSubviews:YES];
    [scrollView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight)];
    [scrollView setClipsToBounds:YES];
}

- (UIView *) viewForZoomingInScrollView: (UIScrollView *) scrollView
{
	return imageView;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
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
    [photoName release];
    [photoTitle release];
    
    [imageView release];
    [scrollView release];
    
    [super dealloc];
}


@end
