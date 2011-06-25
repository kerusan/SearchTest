//
//  OOSearchBar.m
//
//  Created by Kjell Nilsson on 2011-06-23.
//  Copyright 2011 Oops Ab. All rights reserved.
//

#import "OOSearchBar.h"

#import <UIKit/UIView.h>


@implementation OOSearchBar

@synthesize activityIndicator;
@synthesize searchFieldLeftIndicator;
@synthesize searchField;

#pragma mark - Object lifecycle
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectZero] autorelease];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        activityIndicator.hidesWhenStopped = YES;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectZero] autorelease];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        activityIndicator.hidesWhenStopped = YES;
    }
    return self;
}

- (void)dealloc {
    [activityIndicator release]; activityIndicator = nil;
    [searchFieldLeftIndicator release]; searchFieldLeftIndicator = nil;
    [searchField release]; searchField = nil;
    [super dealloc]; 
}

#pragma mark - Setting up the views

// Geting hold of the indicator view. 
// See: http://stackoverflow.com/questions/1209842/replace-bookmarkbutton-with-activityindicator-in-uisearchbar
// The left view in the textfield is by default a magnifying glass icon, the right view empty or shows a clearbutton 
// or a bookmark button.
// As used in other apps the magnifying glass icon is switched to a popup menu for search options, so the best side 
// to put an activity indicator would be to the right. The clearbutton makes no sense during the search, niether does
// the bookmark button.
//
- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
    [super layoutSubviews];
        
    for (UIView* view in self.subviews){
        if([view isKindOfClass:[UITextField class]]) {
            searchField = (UITextField*)view;
            break;
        }
    }
    
    if (searchField != nil) {
        self.searchFieldLeftIndicator = searchField.leftView;
        CGRect rect = searchField.leftView.frame;
        activityIndicator.frame = rect;
    }  
}

#pragma mark - Animating the search field

// When animating we switch to the activity indicator.
- (void)startAnimating:(id)sender {
    if (searchField != nil) {
        self.searchFieldLeftIndicator = searchField.leftView;
        CGRect rect = searchField.leftView.frame;
        activityIndicator.frame = rect;
    }  

    searchField.leftView = activityIndicator;
    [activityIndicator startAnimating];
}

// When animating is stoped we put back the previous view.
- (void)stopAnimating:(id)sender {
    searchField.leftView = searchFieldLeftIndicator;
    [activityIndicator stopAnimating];
}

@end
