//
//  AppStartManager.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.07.2022.
//

import UIKit

final class StartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = AuthViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
    
}

