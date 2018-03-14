//
//  AppDelegate.m
//  Baccus
//
//  Created by Eduardo on 8/3/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AppDelegate.h"
#import "EJMWineModel.h"
#import "EJMWineViewController.h"
#import "EJMWebViewController.h"
#import "EJMWineryModel.h"
#import "EJMWineryTableViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    
    //creamos el modelo
    EJMWineryModel * winery = [[EJMWineryModel alloc] init];
    
    //creamos el controlador
    
    EJMWineryTableViewController *wineryVC = [[EJMWineryTableViewController alloc]initWithModel:winery style:UITableViewStylePlain];
    EJMWineViewController *wineVC =[[EJMWineViewController alloc] initWithModel:[winery redWineAtIndex:0]];
  
    //creamos un navigation
    UINavigationController *wineryNav = [[UINavigationController alloc]initWithRootViewController:wineryVC];
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    // Creamos el combinador SplitView
    
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    
    splitVC.viewControllers = @[wineryNav,wineNav];
    
    // ASIGNAMOS DELEGADO
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    //lo asignamos com controlador raiz
    
    self.window.rootViewController = splitVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
