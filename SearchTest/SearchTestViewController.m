//
//  SearchTestViewController.m
//  SearchTest
//
//  Created by Kjell Nilsson on 2011-06-23.
//

#import "SearchTestViewController.h"
#import "OOSearchBar.h"

@implementation SearchTestViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Tableview stuff

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

#pragma mark - UISearchBarController delegate methods

- (void)searchBarCancelButtonClicked:(UISearchBar*)searchBar {                    
    // Called when cancel button pressed
    if ([searchBar isKindOfClass:[OOSearchBar class]]) {
        canceled = YES;
        [(OOSearchBar*)searchBar stopAnimating:self];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar {
    // Called when text ends editing
    if ([searchBar isKindOfClass:[OOSearchBar class]]) {
        canceled = NO;
        [(OOSearchBar*)searchBar stopAnimating:self];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar*)searchBar {
    // Called when text ends editing
    if ((canceled == NO) && ([searchBar isKindOfClass:[OOSearchBar class]])) {
        [(OOSearchBar*)searchBar startAnimating:self];
        [(OOSearchBar*)searchBar performSelector:@selector(stopAnimating:) withObject:self afterDelay:10.0f];        
    }
    return YES;
}

@end
