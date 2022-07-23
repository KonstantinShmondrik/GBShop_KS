//
//  TabBarViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 23.07.2022.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let welcomeScreenVC = WelcomeScreenViewController()
        
        let tabBarItemWelcomeScreen = UITabBarItem(title: "Главная",
                                                   image: UIImage(systemName: "app"),
                                                   selectedImage: UIImage(systemName: "app.fill"))
        
        welcomeScreenVC.tabBarItem = tabBarItemWelcomeScreen
        
        
        let EditDataVC = EditDataViewController()
        
        let tabBarItemEditData = UITabBarItem(title: "Пользователь",
                                              image: UIImage(systemName: "person.crop.circle"),
                                              selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        EditDataVC.tabBarItem = tabBarItemEditData
        self.viewControllers = [welcomeScreenVC, EditDataVC]
        
    }
}
