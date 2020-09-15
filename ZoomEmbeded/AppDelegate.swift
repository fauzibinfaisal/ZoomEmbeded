//
//  AppDelegate.swift
//  ZoomEmbeded
//
//  Created by Fauzi Fauzi on 14/09/20.
//  Copyright © 2020 defauloper. All rights reserved.
//

import UIKit
import MobileRTC
import MobileCoreServices

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, MobileRTCAuthDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let mainSDK = MobileRTCSDKInitContext()
        mainSDK.domain = "zoom.us"
        MobileRTC.shared().initialize(mainSDK)
        let authService = MobileRTC.shared().getAuthService()
        print(MobileRTC.shared().mobileRTCVersion)
        authService?.delegate        = self
        authService?.clientKey       = "PXfmrtfOjOXgHrdWxvYkZYFkdZZwQkpfSZiT"
        authService?.clientSecret    = "PB4ceuqgtgokohz3NKMv1bVd2UYmPupIUnke"
        authService?.sdkAuth()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func onMobileRTCAuthReturn(_ returnValue: MobileRTCAuthError) {
      print(returnValue)
      if (returnValue != MobileRTCAuthError_Success)
      {
         let msg = "SDK authentication failed, error code: \(returnValue)"
          print(msg)
      } else {
        print("SDK success")
        }
    }


}

