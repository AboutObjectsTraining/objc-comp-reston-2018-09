#import "UIView+Additions.h"

@implementation UIView (Additions)

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}
- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

@end
