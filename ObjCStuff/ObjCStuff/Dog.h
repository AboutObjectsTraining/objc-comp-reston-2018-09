#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    NSString *_name;
    NSString *_breed;
}

+ (id)dogWithName:(NSString *)name
            breed:(NSString *)breed;

- (id)initWithName:(NSString *)name;

- (id)initWithName:(NSString *)name
             breed:(NSString *)breed;

- (NSString *)name;
- (void)setName:(NSString *)newValue;

- (NSString *)breed;
- (void)setBreed:(NSString *)newValue;

- (void)bark;

@end
