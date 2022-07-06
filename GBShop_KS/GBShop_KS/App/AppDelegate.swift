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
        let regist = requestFactory.makeRegistRequestFactory()
        let changeUserData = requestFactory.makeСhangeUserDataFactory()
        let getCatalog = requestFactory.makeGetCatalogRequestFactory()
        let getGoodByld = requestFactory.makeGetGoodByldRequestFactory()
        
        let user = User(id: 123,
                        login: "Somebody",
                        password: "mypassword",
                        email: "some@some.ru",
                        gender: "m",
                        creditCard: "9872389-2424-234224-234",
                        bio: "This is good! I think I will switch to another language",
                        name: "John",
                        lastname: "Doe")
        
        let pageNumber = 1
        let categoryId = 1
        let idProduct = 123
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        auth.logout(userID: user.id ?? 0) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        regist.register(user: user) {response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        changeUserData.changeUserData(user: user) {response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        getCatalog.getCatalog(pageNumber: pageNumber,
                              categoryId: categoryId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        getGoodByld.getGoodByld(productId: idProduct) { response in
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

