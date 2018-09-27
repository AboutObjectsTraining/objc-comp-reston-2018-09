#import "AppDelegate.h"
#import "CoolViewController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    CGRect screenRect = UIScreen.mainScreen.bounds;
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    
    CoolViewController *controller = [[CoolViewController alloc] initWithNibName:@"CoolStuff" bundle:nil];
    
    self.window.rootViewController = controller;
    self.window.backgroundColor = UIColor.yellowColor;
    
    [self.window makeKeyAndVisible];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
