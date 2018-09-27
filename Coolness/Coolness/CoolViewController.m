#import "CoolViewController.h"
#import "CoolViewCell.h"

@interface CoolViewController () <UITextFieldDelegate>
@property (weak, nonatomic) UITextField *textField;
@property (weak, nonatomic) UIView *contentView;
@end

@implementation CoolViewController

- (void)addCell
{
    // TODO: Create a new cell and add it to the content view.
    NSLog(@"In %s, text is %@", __func__, self.textField.text);

    CoolViewCell *newCell = [[CoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.brownColor;
    [newCell sizeToFit];
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

- (void)loadView
{
    NSLog(@"In %s", __func__);

    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(self.view.frame, &accessoryRect, &contentRect, 90.0, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView = contentView;
    
    contentView.clipsToBounds = YES;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(8, 50, 240, 30)];
    [accessoryView addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter some text";
    
    self.textField = textField;
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 256, 50);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cells
    
    CoolViewCell *cell1 = [[CoolViewCell alloc] initWithFrame:CGRectMake(20.0, 30.0, 120.0, 40.0)];
    CoolViewCell *cell2 = [[CoolViewCell alloc] initWithFrame:CGRectMake(50.0, 90.0, 120.0, 40.0)];
    
    [contentView addSubview:cell1];
    [contentView addSubview:cell2];
    
    cell1.text = @"OMG! Cool Cells rock! 🎉";
    cell2.text = @"Command-control-E forevah! 🍺";
    
    [cell1 sizeToFit];
    [cell2 sizeToFit];
    
    cell1.backgroundColor = UIColor.purpleColor;
    cell2.backgroundColor = UIColor.orangeColor;
}

@end
