//
//  PhotoDetailViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"


@interface PhotoDetailViewController : UIViewController <UIScrollViewDelegate> {
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView *imageView;
    
    Photo *photo;
}
@property (nonatomic, retain) Photo *photo;
@end
