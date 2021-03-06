//
//  AppDelegate.m
//  ToDo
//
//  Created by Neil de Carteret on 27/07/2016.
//  Copyright © 2016 Neil de Carteret. All rights reserved.
//

#import "AppDelegate.h"
#import "ToDoListTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL killThemAll = [[[NSProcessInfo processInfo] arguments] containsObject:@"--kill-them-all"];
    if (killThemAll) {
        exit(1);
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ToDoListTableViewController *toDoListTableViewController =
        [[ToDoListTableViewController alloc] initWithComplete:NO];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:toDoListTableViewController];
    //navController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured
    //                                                                       tag:0];
    navController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"To do" image:[UIImage imageNamed:@"mailbox"] tag:0];
    navController.tabBarItem.title = @"To do";
    
    
    ToDoListTableViewController *completeListTableViewController =
        [[ToDoListTableViewController alloc] initWithComplete:YES];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:completeListTableViewController];
    navController2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Complete" image:[UIImage imageNamed:@"check"] tag:0];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController addChildViewController:navController];
    [tabController addChildViewController:navController2];
    //[tabController ]
    
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
