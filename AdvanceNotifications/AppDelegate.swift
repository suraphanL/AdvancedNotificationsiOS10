//
//  AppDelegate.swift
//  AdvanceNotifications
//
//  Created by Suraphan Laokondee on 9/13/2559 BE.
//  Copyright © 2559 Suraphan Laokondee. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
      print(granted)
      print(error)
    }
    UIApplication.shared.registerForRemoteNotifications()
    return true
  }
  
//http://stackoverflow.com/questions/37956482/registering-for-push-notifications-in-xcode-8-swift-3-0
  
  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
  
    let deviceTokenString = deviceToken.hexString()
    print(deviceTokenString)
  }
  
  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Failed to register:", error)
  }
  
}

extension Data {
  func hexString() -> String {
    return self.reduce("") { string, byte in
      string + String(format: "%02X", byte)
    }
  }
}
