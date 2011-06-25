//
//  OOSearchBar.m
//
//  Created by Kjell Nilsson on 2011-06-23.
/*
 
 Copyright 2011 Oops Ab.

 Based on following tip. 
 See: http://stackoverflow.com/questions/1209842/replace-bookmarkbutton-with-activityindicator-in-uisearchbar

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
         SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import "OOSearchBar.h"


@interface OOSearchBar (Private)
- (void) setupSearchBar;
@end

@implementation OOSearchBar

@synthesize activityIndicator;
@synthesize searchFieldLeftIndicator;
@synthesize searchField;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setupSearchBar];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self setupSearchBar];
    }
    return self;
}

- (void)dealloc {
    [activityIndicator release]; activityIndicator = nil;
    [searchFieldLeftIndicator release]; searchFieldLeftIndicator = nil;
    [searchField release]; searchField = nil;
    [super dealloc]; 
}

#pragma mark - Animating the search field

// When animating we switch to the activity indicator.
- (void)startAnimating:(id)sender {
    searchField.leftView = activityIndicator;
    [activityIndicator startAnimating];
}

// When animating is stoped we put back the previous view.
- (void)stopAnimating:(id)sender {
    searchField.leftView = searchFieldLeftIndicator;
    [activityIndicator stopAnimating];
}

@end

@implementation OOSearchBar (Private)

#pragma mark - Setting up the views

- (void) setupSearchBar {
    self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectZero] autorelease];
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    activityIndicator.hidesWhenStopped = YES;
    
    
    // Geting hold of the indicator view. 
    // See: http://stackoverflow.com/questions/1209842/replace-bookmarkbutton-with-activityindicator-in-uisearchbar
    // The left view in the textfield is by default a magnifying glass icon, the right view empty or shows a clearbutton 
    // or a bookmark button.
    // As used in other apps the magnifying glass icon is switched to a popup menu for search options, so the best side 
    // to put an activity indicator would be to the right. The clearbutton makes no sense during the search, niether does
    // the bookmark button.
    //
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

@end