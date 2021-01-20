//
//  AppDelegate.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 02/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure the UI
//        let config = ChatUIConfigurat()
//        config.configureUI()
        IQKeyboardManager.shared.enable = true

        FirebaseApp.configure()

//       let threadsDataSource = ATCGenericLocalHeteroDataSource(items: ChatMockStore.threads)
        
        // HEY THERE, user. read the next few lines below
    
        // Helper file to access remote data for a user
//        let remoteData = ATCRemoteData()
        // Checks if user's firestore actually has channels setup
//        remoteData.getChannels()
        
        // For testing, set this to a usr from 0-4 and run it to your simulator
        // Then, set it to any other user and run it to your phone. THEN-> see my comment in ATCChatMockStore.swift
//       let user = 2
        // If both devices have a different user active, AND the chat thread is available, you can msg live
        
        
        // Window setup
//       window = UIWindow(frame: UIScreen.main.bounds)
//      window?.rootViewController = AppHostViewController(uiConfig: config,
//                                                           threadsDataSource: threadsDataSource,
//                                                         viewer: ChatMockStore.users[user])
       
//        print("currentUser: \(ChatMockStore.users[user].debugDescription)")
//       window?.makeKeyAndVisible()

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


}

