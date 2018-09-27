#import "CoolViewController.h"
#import "CoolViewCell.h"

@interface CoolViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CoolViewController

- (IBAction)addCell
{
    // TODO: Create a new cell and add it to the content view.
    NSLog(@"In %s, text is %@", __func__, self.textField.text);

    CoolViewCell *newCell = [[CoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.brownColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"In %s", __func__);
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//    CGFloat deltaX = currLocation.x - prevLocation.x;
//    CGFloat deltaY = currLocation.y - prevLocation.y;
//    
//    touch.view.frame = CGRectOffset(touch.view.frame, deltaX, deltaY);
//}

- (void)loadView3
{
    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
}

- (void)loadView2
{
    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
    self.view = topLevelObjs.firstObject;
}

- (void)XXXviewDidLoad
{
    [super viewDidLoad];
    
    CoolViewCell *cell1 = [[CoolViewCell alloc] initWithFrame:CGRectMake(20.0, 30.0, 120.0, 40.0)];
    CoolViewCell *cell2 = [[CoolViewCell alloc] initWithFrame:CGRectMake(50.0, 90.0, 120.0, 40.0)];
    
    [self.contentView addSubview:cell1];
    [self.contentView addSubview:cell2];
    
    cell1.text = @"OMG! Cool Cells rock! 🎉";
    cell2.text = @"Command-control-E forevah! 🍺";
    
    [cell1 sizeToFit];
    [cell2 sizeToFit];
    
    cell1.backgroundColor = UIColor.purpleColor;
    cell2.backgroundColor = UIColor.orangeColor;
}

@end
