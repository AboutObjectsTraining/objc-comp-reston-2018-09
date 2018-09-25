#import "Dog.h"
#import "Cat.h"

@interface Dog ()
{
    Cat *_cat;
}

@end


@implementation Dog

+ (id)dogWithName:(NSString *)name
            breed:(NSString *)breed
{
    return [[self alloc] initWithName:name breed:breed];
}

- (id)initWithName:(NSString *)name
{
    return [self initWithName:name breed:nil];
}

- (id)initWithName:(NSString *)name
             breed:(NSString *)breed
{
    self = [super init];
    if (self == nil) return nil;
    
    _name = [name copy];
    _breed = [breed copy];
    _cat = [[Cat alloc] init];
    
    return self;
}

- (NSString *)name {
    return _name;
}
- (void)setName:(NSString *)newValue {
    _name = [newValue copy];
}

- (NSString *)breed {
    return _breed;
}
- (void)setBreed:(NSString *)newValue {
    _breed = [newValue copy];
}

- (Cat *)cat {
    return _cat;
}
- (void)setCat:(Cat *)newValue {
    _cat = newValue;
}

- (void)bark {
    printf("%s says: Woof, woof!\n", [[self name] UTF8String]);
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([[self cat] respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return [[self cat] respondsToSelector:aSelector] ? [self cat] : nil;
}

- (NSString *)description
{
    NSString *dogsName = [self name] != nil ? [self name] : @"unknown";
    return [NSString stringWithFormat:
            @"Class is %@, "
            @"name is %@, "
            @"breed is %@",
            [self class],
            dogsName,
            [self breed]];
}

@end
