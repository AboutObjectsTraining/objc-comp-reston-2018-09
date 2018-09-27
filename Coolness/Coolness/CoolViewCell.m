#import "CoolViewCell.h"

const UIEdgeInsets TextInsets = { 8, 12, 10, 12 };
const CGPoint TextOrigin = { 12, 8 };

@interface CoolViewCell ()
@property (getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;
@end


@implementation CoolViewCell

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Animation methods

- (void)bounce
{
    [self animateBounceWithDuration:1.0 size:CGSizeMake(120.0, 240.0)];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    [UIView animateWithDuration:duration
                     animations:^{ [self configureBounceWithSize:size]; }
                     completion:^(BOOL finished) { [self animateFinishBounceWithDuration:duration]; }];
}

- (void)animateFinishBounceWithDuration:(NSTimeInterval)duration
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                     animations:^{ weakSelf.transform = CGAffineTransformIdentity; }];
}

- (void)configureBounceWithSize:(CGSize)size
{
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(transform, M_PI_2);
}


// MARK: - Drawing and resizing

/**
 Returns a dictionary of text attributes.
 @return text attributes
 */
+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += TextInsets.left + TextInsets.right;
    newSize.height += TextInsets.top + TextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect
{
    [self.text drawAtPoint:TextOrigin withAttributes:self.class.textAttributes];
}

@end

// MARK: - UIResponder methods

@implementation CoolViewCell (Responding)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
//    [super touchesBegan:touches withEvent:event];
//    Conceptually, [self.nextResponder touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
//    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self finishTouches:touches];
//    [super touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self finishTouches:touches];
//    [super touchesCancelled:touches withEvent:event];
}

- (void)finishTouches:(NSSet<UITouch *> *)touches {
    self.highlighted = NO;
}

@end
