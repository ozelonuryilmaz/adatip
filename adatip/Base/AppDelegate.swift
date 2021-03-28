//
//  AppDelegate.swift
//  adatip
//
//  Created by Onur YILMAZ on 17.09.2020.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FBSDKCoreKit
import GoogleSignIn
import IQKeyboardManagerSwift
//import IISightSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: *** IQKeyboardManager
        IQKeyboardManager.shared.enable = true
        
        // MARK: *** IISightSDK
        //IISightSDKManager.shared().start(withPartnerUrl: "sdktest.11sight.com")
        
        // MARK: *** Firebase Messaging
        if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in
            })
            
        }else {
            
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self
        
        // MARK: *** Firebase
        FirebaseApp.configure()
        
        // MARK: *** Facebook Login
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // MARK: *** Google Login
        GIDSignIn.sharedInstance().clientID = "268700802750-pv6ueev81i5b1pgcj9i8rjhn2gsbj9e6.apps.googleusercontent.com"
        
        return true
    }
    
    // MARK: *** Facebook Login
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handledFB = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
        let handledGoogle = GIDSignIn.sharedInstance().handle(url)
        
        return handledFB || handledGoogle
    }
    
    // MARK: *** Firebase Messaging
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }
    
    
}

// MARK: *** Firebase Messaging
extension AppDelegate: MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict:[String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
}

// MARK: *** Firebase Messaging
// TODO: *** Add for IISigth
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // Print full message.
    print(userInfo)

    // Change this to your preferred presentation option
    completionHandler([[.alert, .sound]])
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print full message.
    print(userInfo)

    completionHandler()
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
