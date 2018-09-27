#import "CoolViewController.h"

@interface CoolViewController ()
@end

@implementation CoolViewController
@end


@implementation CoolViewController (NibLoadingExamples)
- (void)loadView3 {
    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
}
- (void)loadView2 {
    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
    self.view = topLevelObjs.firstObject;
}
@end
