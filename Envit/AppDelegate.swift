//
//  AppDelegate.swift
//  Envit
//
//  Created by Likhit Garimella on 13/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        // Status bar color
        
        // In Info.plist...
        // View controller-based status bar appearance -> NO
        
        /* UIApplication.shared.isStatusBarHidden = false
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
            // Fallback on earlier versions
        } */
        
        /* func addShortcuts(application: UIApplication) {
            
            let shortcut1 = UIMutableApplicationShortcutItem(type: "TechShareDoc", localizedTitle: "Tech Share", localizedSubtitle: "Discover techies", icon: UIApplicationShortcutIcon(type: .update), userInfo: nil);
            
            let shortcut2 = UIMutableApplicationShortcutItem(type: "ProjectShareDoc", localizedTitle: "Project Share", localizedSubtitle: "Explore projects", icon: UIApplicationShortcutIcon(type: .share), userInfo: nil);
            
            let shortcut3 = UIMutableApplicationShortcutItem(type: "ActivityDoc", localizedTitle: "Activity", localizedSubtitle: "Notifications", icon: UIApplicationShortcutIcon(type: .compose), userInfo: nil);
            
            let shortcut4 = UIMutableApplicationShortcutItem(type: "ProfileDoc", localizedTitle: "Profile", localizedSubtitle: "Your profile", icon: UIApplicationShortcutIcon(type: .contact), userInfo: nil);
            
            application.shortcutItems = [shortcut1, shortcut2, shortcut3, shortcut4]
            
        } */
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .systemBlue
        
        FirebaseApp.configure()
        
        // Increase Launch Screen Time
        Thread.sleep(forTimeInterval: 1)
        // RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.0)) // Old Code
        return true
        
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        if #available(iOS 13.0, *) {
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        } else {
            // Fallback on earlier versions
        }
        return UISceneConfiguration(name: "False", sessionRole: connectingSceneSession.role)
        }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}   // #80
