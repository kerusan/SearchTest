//
//  SearchTestAppDelegate.h
//  SearchTest
//
//  Created by Kjell Nilsson on 2011-06-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchTestViewController;

@interface SearchTestAppDelegate : NSObject <UIApplicationDelegate, UISearchBarDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SearchTestViewController *viewController;

@end
