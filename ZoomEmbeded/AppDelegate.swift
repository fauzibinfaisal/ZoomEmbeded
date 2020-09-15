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
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: newViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let mainSDK = MobileRTCSDKInitContext()
        mainSDK.domain = "zoom.us"
        MobileRTC.shared().initialize(mainSDK)
        let authService = MobileRTC.shared().getAuthService()
        print(MobileRTC.shared().mobileRTCVersion())
        authService?.delegate        = self
        authService?.clientKey       = "PXfmrtfOjOXgHrdWxvYkZYFkdZZwQkpfSZiT"
        authService?.clientSecret    = "PB4ceuqgtgokohz3NKMv1bVd2UYmPupIUnke"
        authService?.sdkAuth()
        return true
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

