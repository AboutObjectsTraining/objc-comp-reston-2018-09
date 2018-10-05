#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELReadingListDataSource : NSObject <UITableViewDataSource>

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end
