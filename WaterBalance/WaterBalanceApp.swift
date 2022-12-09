//
//  WaterBalanceApp.swift
//  WaterBalance
//
//  Created by Иван Морозов on 14.05.2022.
//

import SwiftUI
import Firebase

@main
struct WaterBalanceApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            BottomTabBar()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate{
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            
            print("App Delegate")
            return true
        }
    }
}
