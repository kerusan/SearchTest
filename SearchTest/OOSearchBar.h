//
//  OOSearchBar.h
//
//  Created by Kjell Nilsson on 2011-06-23.
//  Copyright 2011 Oops Ab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UISearchBar.h>
#import <UIKit/UITextField.h>


@interface OOSearchBar : UISearchBar {
    
}

@property (nonatomic, retain) UIActivityIndicatorView* activityIndicator;
@property (nonatomic, retain) UIView* searchFieldLeftIndicator;
@property (nonatomic, retain) UITextField* searchField;

- (void)startAnimating:(id)sender;
- (void)stopAnimating:(id)sender;

@end
