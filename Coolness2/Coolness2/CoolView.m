#import "CoolView.h"
#import "CoolViewCell.h"

@interface CoolView () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation CoolView

- (IBAction)addCell
{
    // TODO: Create a new cell and add it to the content view.
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    
    CoolViewCell *newCell = [[CoolViewCell alloc] init];
    [self addSubview:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.brownColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

@end
