//
//  SearchTestAppDelegate.m
//  SearchTest
//
//  Created by Kjell Nilsson on 2011-06-23.
//

#import "SearchTestAppDelegate.h"

#import "SearchTestViewController.h"

@implementation SearchTestAppDelegate


@synthesize window=_window;
@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
