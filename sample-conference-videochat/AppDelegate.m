//
//  AppDelegate.m
//  sample-multiconference-videochat
//
//  Copyright (c) 2017 QuickBlox. All rights reserved.
//

#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "Settings.h"

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

const NSTimeInterval kQBAnswerTimeInterval = 60.0f;
const NSTimeInterval kQBDialingTimeInterval = 5.0f;

#define ENABLE_STATS_REPORTS 1

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [QBSettings setApiEndpoint:@"https://apireactoo.quickblox.com"
                  chatEndpoint:@"chatreactoo.quickblox.com"
                forServiceZone:QBConnectionZoneTypeDevelopment];
    [QBSettings setServiceZone:QBConnectionZoneTypeDevelopment];
    [QBSettings setAccountKey:@"vvyqrAfk-jTv9zaXK-sX"];
    [QBSettings setApplicationID:4];
    [QBSettings setAuthKey:@"EPO9hd7LQGXZQAJ"];
    [QBSettings setAuthSecret:@"5NGT2c5Q9k68avn"];
    
    [QBSettings setLogLevel:QBLogLevelNothing];
    [QBSettings disableXMPPLogging];
    
    [QBRTCConfig setAnswerTimeInterval:kQBAnswerTimeInterval];
    [QBRTCConfig setDialingTimeInterval:kQBDialingTimeInterval];
    [QBRTCConfig setLogLevel:QBRTCLogLevelVerbose];
    
    [QBRTCConfig setConferenceEndpoint:@"wss://groupcallsreactoo.quickblox.com:8989"];
    
#if ENABLE_STATS_REPORTS
    [QBRTCConfig setStatsReportTimeInterval:1.0f];
#endif
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    [QBRTCClient initializeRTC];
    
    [Fabric with:@[CrashlyticsKit]];
    
    // loading settings
    [Settings instance];
    
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
