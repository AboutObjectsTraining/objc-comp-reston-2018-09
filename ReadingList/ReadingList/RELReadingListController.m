#import "RELReadingListController.h"
#import "RELReadingListDataSource.h"
#import <ReadingListModel/ReadingListModel.h>

#import "RELViewBookController.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELReadingListDataSource *dataSource;
@end

@implementation RELReadingListController

// MARK: Unwind segues

- (IBAction)doneEditing:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    [self.dataSource save];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RELViewBookController *controller = segue.destinationViewController;
    RLMBook *book = [self.dataSource bookAtIndexPath:self.tableView.indexPathForSelectedRow];
    controller.book = book;
}

@end
