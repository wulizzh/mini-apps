//
//  SceneDelegate.m
//  12
//
//  Created by xhorse on 2022/1/20.
//

#import "SceneDelegate.h"
#import "TableViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        self.window.frame = windowScene.coordinateSpace.bounds;
        
        UITabBarController *tabbarController = [[UITabBarController alloc] init];
        UITableViewController *controller1 = [[TableViewController alloc] init];
        
        UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:controller1];
        navigationController.view.backgroundColor = [UIColor lightGrayColor];
        navigationController.tabBarItem.title = @"新闻";
        navigationController.navigationBar.translucent = NO;
        
        UIViewController *controller2 = [[UIViewController alloc] init];
        controller2.view.backgroundColor = [UIColor yellowColor];
        controller2.tabBarItem.title = @"视频";
        
        UIViewController *controller3 = [[UIViewController alloc] init];
        controller3.view.backgroundColor = [UIColor blueColor];
        controller3.tabBarItem.title = @"推荐";
        
        UIViewController *controller4 = [[UIViewController alloc] init];
        controller4.view.backgroundColor = [UIColor greenColor];
        controller4.tabBarItem.title = @"我的";
        
        // 将四个页面的 UIViewController 加入到 UITabBarController 之中
        [tabbarController setViewControllers: @[navigationController, controller2, controller3, controller4]];
        
        self.window.rootViewController = tabbarController;
        [self.window makeKeyAndVisible];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
