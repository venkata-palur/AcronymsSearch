//
//  AcronymsTableViewController.m
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import "AcronymsTableViewController.h"
#import "MBProgressHUD.h"
#import "AcromineAPI.h"
#import "Acronym.h"
#import "AcronymResultTableViewCell.h"

@interface AcronymsTableViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *acronymsSearchBar;
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, assign) BOOL didUserSearch;
@end

@implementation AcronymsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.dataSource = [NSMutableArray new];
    self.didUserSearch = NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.dataSource count] == 0 && self.didUserSearch) {
        return 1; // 1 cell to show "No results found"
    }
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"AcronymsCell";
    AcronymResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if ([self.dataSource count] > 0) {
        Acronym *cellData = (self.dataSource)[indexPath.row];
        cell.fullFormLabel.text = [NSString stringWithFormat:@"%@", cellData.fullForm];
        cell.sinceLabel.text = [NSString stringWithFormat:@"since: %@", cellData.since];
        cell.frequencyLabel.text = [NSString stringWithFormat:@"frequency: %@", cellData.usageFrequency];
    } else {
        cell.fullFormLabel.text = @"No Results Found";
        cell.sinceLabel.text = @"";
        cell.frequencyLabel.text = @"";
    }
    return cell;
}


#pragma mark - SearchBar Delegates

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // enable search key Bool
    self.didUserSearch = YES;
    
    // Dismiss the active keyword
    [searchBar resignFirstResponder];
    
    // Get the search text and make it url safe
    NSString *searchText = [searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // show activity indicator
    [self showActivityIndicator:YES];
    
    // look for results
    [self searchForAcronyms:searchText];
}

- (void)searchForAcronyms: (NSString *) searchText {
    [AcromineAPI fetchAcronyms:searchText completion:^(BOOL success, id response, NSError *error) {
        [self showActivityIndicator:NO];
        [self.dataSource removeAllObjects];
        
        if (success) {
            NSLog(@"Response: %@", response);
            // build model objects
            if ([response isKindOfClass:[NSArray class]]) {
                for (id acronym in response) {
                    Acronym *object = [[Acronym alloc] initWithAcronym:acronym[@"lf"] usedSince:acronym[@"since"] usageFrequency:acronym[@"freq"]];
                    [self.dataSource addObject:object];
                    
                }
                [self.tableView reloadData];
            }
        } else {
            // show the error
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:okayAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    }];
}

- (void) showActivityIndicator: (BOOL) show {
    if (show) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    } else {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }
}

@end
