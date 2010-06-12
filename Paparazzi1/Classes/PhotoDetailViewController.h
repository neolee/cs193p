//
//  PhotoDetailViewController.h
//  Paparazzi
//
//  Created by Neo Lee on 6/12/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoDetailViewController : UIViewController {
    NSString *photoName;
    NSString *photoTitle;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView *imageView;
}
@property (nonatomic, copy) NSString *photoName;
@property (nonatomic, copy) NSString *photoTitle;
@end
