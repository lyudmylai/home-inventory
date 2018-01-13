//
//  AppDelegate.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/12/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETAppDelegate.h"
#import "JETPhotosViewController.h"
#import "JETInventoryViewController.h"

@interface JETAppDelegate ()

@property (strong, nonatomic) UITabBarController *tabBarController;

@end

@implementation JETAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    JETPhotosViewController *photosVC = [[JETPhotosViewController alloc]init];
    UINavigationController *photosNavigationController =
    [[UINavigationController alloc]initWithRootViewController:photosVC];
    JETInventoryViewController *inventoryVC = [[JETInventoryViewController alloc]init];
    UINavigationController *inventoryNavigationController =
    [[UINavigationController alloc]initWithRootViewController:inventoryVC];
    self.tabBarController = [[UITabBarController alloc]init];
    [self.tabBarController setViewControllers:@[
                                               photosNavigationController,
                                               inventoryNavigationController
                                               ]];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"HomeInventory"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
