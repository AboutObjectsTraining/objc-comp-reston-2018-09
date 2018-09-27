#import <XCTest/XCTest.h>

void sayHello(void) {
    printf("Hello!\n");
}

void sayHelloWithName(NSString *name) {
    NSLog(@"Hello, %@", name);
}

void say(void (*what)(void)) {
    what();
}

@interface UnitTests : XCTestCase @end

@implementation UnitTests

- (void)setUp { printf("\n"); }
- (void)tearDown { printf("\n"); }

- (void)testBlockLiteral
{
    void (^foo)(void) = ^{ NSLog(@"Hello"); };
    foo();
}

- (void)testBlockLiteralWithParameter
{
    void (^bar)(NSString *) = ^(NSString *name){ NSLog(@"Hello, %@", name); };
    bar(@"Fred");
}

- (void)printMe:(void (^)(NSNumber *))block
{
    void (^copyOfBlock)(NSNumber *) = [block copy];

    NSArray *things = @[@1, @2, @3];
    for (id thing in things) {
        copyOfBlock(thing);
    }
}

- (void)testCapturingLocalState
{
    NSString *stuff = @"Woo!";
    
    [self printMe:^(NSNumber *thing) {
        NSLog(@"Thing is %@. I am %@. %@", thing, self, stuff);
    }];
}

- (void)testFunctionPointers
{
    void (*foo)(void) = sayHello;
    foo();
    printf("%p\n", sayHello);
    
    void (*bar)(NSString *) = sayHelloWithName;
    bar(@"Fred");
}

- (void)testPassingAFunctionPointer
{
    void (*foo)(void) = sayHello;
    say(foo);
    say(sayHello);
}

@end
