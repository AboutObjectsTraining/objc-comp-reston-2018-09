#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"

void DoDogStuff() {
    Dog *newInstance = [Dog alloc];
    newInstance = [newInstance init];
    NSLog(@"%@", newInstance);
    
    Dog *dog = [[Dog alloc] init];
    [dog setName:@"Bowser"];
    [dog setBreed:@"Boxer"];
    
    NSLog(@"%@", dog);
    
    NSString *text = [dog description];
    const char *s = [text UTF8String];
    printf("C string is %s\n", s);
    
    NSLog(@"Dog's name is %@", [dog name]);
    
    Dog *rover = [[Dog alloc] initWithName:@"Rover"
                                     breed:@"Lab"];
    NSLog(@"%@", rover);
    
    Dog *spot = [Dog dogWithName:@"Spot"
                           breed:@"Dalmation"];
    NSLog(@"%@", spot);
    
    [spot bark];
}

void MeowLikeACat(void)
{
    id rover = [Dog dogWithName:@"Rover" breed:@"Lab"];
    
    SEL meowSelector = @selector(meow);
    
    if ([rover respondsToSelector:meowSelector]) {
        [rover meow];
    }
    else {
        NSLog(@"Unmatched selector %@\n", NSStringFromSelector(meowSelector));
    }
    
    [rover meow];
}

void MessWithArrays()
{
    id array1 = [NSArray alloc];
//    id array1_1 = [NSArray alloc];
    id mutableArray1 = [NSMutableArray alloc];
    mutableArray1 = [mutableArray1 initWithObjects:@1, @2, nil];
    id array2 = [array1 initWithObjects:@"One", @"Two", nil];
    NSLog(@"%@", array1);
    NSLog(@"%@", array2);
    
    for (NSString *string in array2) {
        NSLog(@"%@", string);
    }
    
    mutableArray1[0] = @3;
    NSLog(@"%@", mutableArray1);
}

int main(int argc, const char * argv[]) {
    
//    DoDogStuff();
//    MeowLikeACat();
    
    MessWithArrays();
}
