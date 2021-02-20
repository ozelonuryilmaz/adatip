//
//  AppDelegate.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import FBSDKCoreKit
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
        
        // MARK: *** Facebook Login
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    // MARK: *** Facebook Login
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
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


//Facebook Login
/*
 // SceneDelegate.swift
 import FBSDKCoreKit
   ...
 func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
     guard let url = URLContexts.first?.url else {
         return
     }

     ApplicationDelegate.shared.application(
         UIApplication.shared,
         open: url,
         sourceApplication: nil,
         annotation: [UIApplication.OpenURLOptionsKey.annotation]
     )
 }
 */
