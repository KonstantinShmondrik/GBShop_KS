//
//  RegistrationViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.07.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var authView: RegistrationView {
        return self.view as! RegistrationView
    }
    
    let requestFactory = RequestFactory()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        let view = RegistrationView()
//        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   
}
