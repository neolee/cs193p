#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
    NSLog(@"Section 1: Path Info");
    
    NSString *home = @"~";
    home = [home stringByExpandingTildeInPath];
    NSLog(@"  My home folder: %@", home);
    
    NSArray *folders = [home pathComponents];
    NSLog(@"  Path components:");
    for (int i = 0; i < folders.count; i++ ) {
        NSLog(@"    %@", [folders objectAtIndex:i]);
    }
}

void PrintProcessInfo() {
    NSLog(@"Section 2: Process Info");
    
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    NSLog(@"  Process Name: '%@' Process ID: '%d'", [processInfo processName], [processInfo processIdentifier]);
}

void PrintBookmarkInfo() {
    NSLog(@"Section 3: Bookmarks");
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:5];
    
    // Initialization
    [dict setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
    [dict setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
    [dict setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
    [dict setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
    [dict setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];
    
    // Enumerate and find all bookmarks begin with 'Stanford'
    NSString *key;
    NSEnumerator *keyEnumerator = [dict keyEnumerator];
    while (key = [keyEnumerator nextObject])
    {
        if ( [key hasPrefix:@"Stanford"] ) {
            NSLog(@"  Key: '%@' URL: '%@'", key, [dict objectForKey:key]);
        }
    }
}

void PrintIntrospectionInfo() {
    NSLog(@"Section 4: Introspection");

    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:5];
    
    [objects addObject:[NSString stringWithString:@"Hello World!"]];
    [objects addObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"]];
    [objects addObject:[NSProcessInfo processInfo]];
    [objects addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Neo", @"Papa", @"Hui", @"Mama", @"Jessica", @"Prince", nil]];
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    [str appendString:@", Neo!"];
    [objects addObject:str];
    
    NSObject *obj;
    SEL sel = @selector(lowercaseString);
    BOOL canLowercase;
    for (int i = 0; i < objects.count; i++ ) {
        obj = [objects objectAtIndex:i];
        
        NSLog(@"  Class name: %@", [obj className]);
        NSLog(@"  Is Member of NSString: %@", [obj isMemberOfClass:[NSString class]]?@"YES":@"NO");
        NSLog(@"  Is Kind of NSString: %@", [obj isKindOfClass:[NSString class]]?@"YES":@"NO");
        canLowercase = [obj respondsToSelector:sel];
        NSLog(@"  Responds to lowercaseString: %@", canLowercase?@"YES":@"NO");
        if (canLowercase) 
            NSLog(@"  lowercaseString is: %@", [obj performSelector:sel withObject:obj]);
        NSLog(@"  ======================================");
    }
}

void PrintPolygonInfo() {
    NSLog(@"Section 6: Custom Class");
    
    NSMutableArray *polygons = [[NSMutableArray alloc] initWithCapacity:5];

    PolygonShape *polygon = [[PolygonShape alloc] init];
    polygon.minimumNumberOfSides = 3;
    polygon.maximumNumberOfSides = 7;
    polygon.numberOfSides = 4;
    [polygons addObject:polygon];
    NSLog(@"  %@", polygon);
    [polygon release];

    polygon = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
    [polygons addObject:polygon];
    NSLog(@"  %@", polygon);
    [polygon release];
    
    polygon = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
    [polygons addObject:polygon];
    NSLog(@"  %@", polygon);
    [polygon release];
    
    for (int i = 0; i < polygons.count; i++) {
        [[polygons objectAtIndex:i] setNumberOfSides:8];
    }
    
    [polygons release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    PrintPathInfo();
    PrintProcessInfo();
    PrintBookmarkInfo();
    PrintIntrospectionInfo();
    PrintPolygonInfo();
    
    [pool drain];
    return 0;
}
