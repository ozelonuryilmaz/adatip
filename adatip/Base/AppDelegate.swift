//
//  AppDelegate.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import IISightSDK
//import PushKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: *** IQKeyboardManager
        IQKeyboardManager.shared.enable = true
        
        // MARK: *** IISightSDK
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if error == nil {
                DispatchQueue.main.async {
                    //DID REQUEST THE NOTIFICATION
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        //self.voipRegistration()
        
        IISightSDKManager.shared().start(withPartnerUrl: "sdktest.11sight.com")
        
        return true
    }
    
    //Get device token
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
        {
            let tokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
            
            print("The token: \(tokenString)")
        }
    
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
}

// MARK: *** IISightSDK and Notification Delegate
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
        // _ == belongsToSDK
        if response is UNTextInputNotificationResponse {
            let reply = response as? UNTextInputNotificationResponse
            _ = IISightSDKManager.shared().localNotificationBelongs(toIISight: response.actionIdentifier, content: reply?.userText)
        } else {
            _ = IISightSDKManager.shared().localNotificationBelongs(toIISight: response.actionIdentifier, content: nil)
        }
        completionHandler()
    }
}
/*
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
