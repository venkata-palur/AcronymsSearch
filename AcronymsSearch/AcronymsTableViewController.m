//
//  AcronymsTableViewController.m
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import "AcronymsTableViewController.h"

@interface AcronymsTableViewController () <UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *acronymsSearchBar;
//@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation AcronymsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)configureSearchBar {
//    self.searchController.searchBar.placeholder = @"Enter Acronyms";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

#pragma mark - SearchBar Delegates

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = searchBar.text;
    [self searchForAcronyms:searchText];
}

- (void)searchForAcronyms: (NSString *) searchText {
    // show loading screen
    // do rest calls
    // hide loading screen
}

@end
