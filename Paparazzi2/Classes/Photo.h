//
//  Photo.h
//  Paparazzi2
//
//  Created by Neo Lee on 6/21/10.
//  Copyright 2010 7thGen Studio. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Person;

@interface Photo :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Person * person;

@end



