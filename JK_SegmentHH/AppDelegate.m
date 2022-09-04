//
//  AppDelegate.m
//  JK_SegmentHH
//
//  Created by 纵昂 on 2022/9/2.
//

#import "AppDelegate.h"
#import "JKViewController.h"

#define MainScreen  [UIScreen mainScreen]
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:MainScreen.bounds];
    JKViewController * hhh = [JKViewController navPageVC];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:hhh];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
