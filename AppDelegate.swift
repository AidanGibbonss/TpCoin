//
//  AppDelegate.swift
//

import UIKit
import IQKeyboardManagerSwift
import UserNotifications

let TpCoinAppId:String = "zhDf1xYEMh529rU4zNvni4"
let TpCoinAppKey:String = "17CYmjJo2l7bXMajpVKVG3"
let TpCoinAppSecret:String = "7D0A2kDbKW5aSPurQ0ww34"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GeTuiSdkDelegate, UNUserNotificationCenterDelegate{

    var window: UIWindow?
    var allowrotate:NSInteger = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        GeTuiSdk.start(withAppId: TpCoinAppId, appKey: TpCoinAppKey, appSecret: TpCoinAppSecret, delegate: self)
        let systemVer = (UIDevice.current.systemVersion as NSString).floatValue
        if systemVer >= 10.0 {
            if #available(iOS 10.0, *) {
                let center:UNUserNotificationCenter = UNUserNotificationCenter.current()
                center.delegate = self;
                center.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { (granted:Bool, error:Error?) -> Void in
                })
                
                UIApplication.shared.registerForRemoteNotifications()
            } else {
                if #available(iOS 8.0, *) {
                    let userSettings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
                    UIApplication.shared.registerUserNotificationSettings(userSettings)
                    
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }else if systemVer >= 8.0 {
            if #available(iOS 8.0, *) {
                let userSettings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
                UIApplication.shared.registerUserNotificationSettings(userSettings)
                
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if(allowrotate == 1)
        {
            return  UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.portrait.rawValue|UIInterfaceOrientationMask.landscapeLeft.rawValue|UIInterfaceOrientationMask.landscapeRight.rawValue)
        }
        else
        {
            return  UIInterfaceOrientationMask.portrait
        }
    }
    func geTuiSdkDidRegisterClient(_ clientId: String!) {
        
    }
    
    func geTuiSdkDidOccurError(_ error: Error!) {
        
    }
    
    func geTuiSdkDidSendMessage(_ messageId: String!, result: Int32) {
        
    }
    
    func geTuiSdkDidReceivePayloadData(_ payloadData: Data!, andTaskId taskId: String!, andMsgId msgId: String!, andOffLine offLine: Bool, fromGtAppId appId: String!) {
        
        var payloadMsg = ""
        if((payloadData) != nil) {
            payloadMsg = String.init(data: payloadData, encoding: String.Encoding.utf8)!;
        }
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        GeTuiSdk.registerDeviceTokenData(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        application.applicationIconBadgeNumber = 0
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        GeTuiSdk.handleRemoteNotification(userInfo)
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge,.sound,.alert])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        GeTuiSdk.handleRemoteNotification(response.notification.request.content.userInfo)
        completionHandler()
    }
    
    

}

