//
//  AppDelegate.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
//import IISightSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: *** IQKeyboardManager
        IQKeyboardManager.shared.enable = true
        
        // MARK: *** IISightSDK
        //IISightSDKManager.shared().start(withPartnerUrl: "sdktest.11sight.com")
        //registerForNotification()
        
        return true
    }
    /*
    public func registerForNotification() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if (error == nil) {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }*/
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}
/*
// MARK: *** Notification Delegate
extension AppDelegate: UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let belongsToSDK = IISightSDKManager.shared().localNotificationBelongs(toIISight: notification.request.content.categoryIdentifier, content: nil)
        
        if belongsToSDK {
            print("11sight notification")
        }else {
            print("App notification")
        }
        
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
    //This is for the user tapping on the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let textResponse = response as? UNTextInputNotificationResponse {
            let reply = textResponse.userText
            _ = IISightSDKManager.shared().localNotificationBelongs(toIISight: response.notification.request.identifier, content: reply)
            // Send reply message
        } else {
            let belongsTOSDK = IISightSDKManager.shared().localNotificationBelongs(toIISight: response.notification.request.identifier, content: nil)
            if !belongsTOSDK && response.notification.request.identifier == "user_notification" {
                NotificationCenter.default.post(name: NSNotification.Name("HandleNotification"), object: nil, userInfo: ["action" : "user_notification"])
            }
        }
        completionHandler()
    }
}
*/
/*
extension AppDelegate {
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        _ = IISightSDKManager.shared().localNotificationBelongs(toIISight: notification.category!, content: nil)
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        _ = IISightSDKManager.shared().localNotificationBelongs(toIISight: notification.category!, content: nil)
        completionHandler()
    }
    
    //Get device token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        IISightSDKManager.shared().setApnsNormalToken(deviceToken.base64EncodedString());
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //print(userInfo)
        _ = IISightSDKManager.shared().remoteNotificationBelongs(toIISight: userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
    }
}*/




/*
 //import PushKit
 /*
 // Register for VoIP notifications
 func voipRegistration() {
 
 // Create a push registry object
 let mainQueue = DispatchQueue.main
 let voipRegistry: PKPushRegistry = PKPushRegistry(queue: mainQueue)
 voipRegistry.delegate = self
 voipRegistry.desiredPushTypes = [PKPushType.voIP]
 }
 */
 
 
 //MARK: - PKPushRegistryDelegate
 extension AppDelegate : PKPushRegistryDelegate {
 
 // Handle updated push credentials
 func pushRegistry(_ registry: PKPushRegistry, didUpdate credentials: PKPushCredentials, for type: PKPushType) {
 print(credentials.token)
 let deviceToken = credentials.token.map { String(format: "%02x", $0) }.joined()
 print("pushRegistry -> deviceToken :\(deviceToken)")
 }
 
 func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
 print("pushRegistry:didInvalidatePushTokenForType:")
 }
 
 // Handle incoming pushes
 func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
 print(payload.dictionaryPayload)
 }
 }
 */
