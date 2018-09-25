#import "Cat.h"

@implementation Cat

- (void)meow {
    printf("Meoowww!\n");
    [self performSelector:@selector(rel_bark)];
}

- (id)copyWithZone:(NSZone *)zone {
    Cat *newCat = [[Cat alloc] init];
    // If we have instance variables, copy their values into
    // the new object before returning it.
    return newCat;
}

@end

@implementation Cat (Barking)

- (void)bark {
    printf("Woof, woof, meooww!\n");
}

@end


@implementation NSString (Barking)

- (void)rel_bark {
    printf("%s says Woof, woof!\n", [self UTF8String]);
}

@end
