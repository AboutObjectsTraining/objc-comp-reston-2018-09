#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (UIViewController *)rel_destinationViewController
{
    if ([self.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = self.destinationViewController;
        return navController.childViewControllers.firstObject;
    }
    return self.destinationViewController;
}

@end
