#import "RELReadingListDataSource.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELReadingListDataSource ()
@property (strong, nonatomic) IBOutlet RLMReadingListStore *store;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListDataSource

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.store.fetchedReadingList;
    }
    return _readingList;
}

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return [self.readingList bookAtIndexPath:indexPath];
}

- (void)save {
    [self.store saveReadingList:self.readingList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (nonnull UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    
    [self populateCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)populateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
}

@end
