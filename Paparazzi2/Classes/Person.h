//
//  Person.h
//  Paparazzi2
//
//  Created by Neo Lee on 6/21/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Photo;

@interface Person :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* photos;

@end


@interface Person (CoreDataGeneratedAccessors)
- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)value;
- (void)removePhotos:(NSSet *)value;

@end

