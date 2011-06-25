//
//  SearchTestViewController.m
//  SearchTest
//
//  Created by Kjell Nilsson on 2011-06-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    // Called when text ends editing
    if ([searchBar isKindOfClass:[OOSearchBar class]]) {
        [(OOSearchBar*)searchBar stopAnimating:self];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    // Called when text ends editing
    if ([searchBar isKindOfClass:[OOSearchBar class]]) {
        [(OOSearchBar*)searchBar startAnimating:self];
        [(OOSearchBar*)searchBar performSelector:@selector(stopAnimating:) withObject:self afterDelay:10.0f];        
    }
}

@end
