#import <Foundation/Foundation.h>

@interface Cat : NSObject <NSCopying>

- (void)meow;

@end

@interface NSString (Barking)
- (void)rel_bark;
@end
