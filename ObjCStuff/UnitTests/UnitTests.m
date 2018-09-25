#import <XCTest/XCTest.h>
#import "Dog.h"
#import "Cat.h"

@interface UnitTests : XCTestCase

@end

@implementation UnitTests

- (void)setUp {
    printf("\n");
}
- (void)tearDown {
    printf("\n");
}

- (void)testStuffThatIFeelLikeTesting
{
    Dog *fido = [[Dog alloc] init];
    NSLog(@"%@", fido);
    XCTAssertEqual(1, 1);
}

- (void)testCopyCat
{
    Cat *cat1 = [[Cat alloc] init];
    NSLog(@"%@", cat1);
    
    Cat *cat2 = [cat1 copy];
    NSLog(@"%@", cat2);
}

- (void)testBarkLikeACat
{
    Cat *cat = [[Cat alloc] init];
    [cat meow];
}

- (void)testBarkLikeAString
{
    [@"Foo" rel_bark];
}

@end
