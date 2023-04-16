//
//  GuessMaster2023App.swift
//  GuessMaster2023
//
//  Created by Orange on 2023-03-18.
//

import SwiftUI
import FirebaseCore

@main
struct GuessMaster2023App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
