//
//  AppDelegate.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 09.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let requestFactory = RequestFactory()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFactory()
        
        let user = User(id: 123, login: "geekbrains", name: "John", lastname: "Doe")
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        auth.logout(userID: user.id) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
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

