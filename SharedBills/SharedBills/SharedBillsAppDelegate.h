//
//  SharedBillsAppDelegate.h
//  SharedBills
//
//  Created by Donny Amfahr on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
// Test by Doug

#import <UIKit/UIKit.h>

@interface SharedBillsAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
