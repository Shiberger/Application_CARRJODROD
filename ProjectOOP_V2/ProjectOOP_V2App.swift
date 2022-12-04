//
//  ProjectOOP_V2App.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 15/11/2565 BE.
//

import SwiftUI
import Firebase

@main

struct ProjectOOP_V2App: App {
    // MARK: Since doing Background fetching Intializing
    @StateObject var pomodoroModel: PomodoroModel = .init()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
    }
}


// MARK: Initializing Firebase
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    // MARK: Phone Auth Needs to Intialize Remote Notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}
