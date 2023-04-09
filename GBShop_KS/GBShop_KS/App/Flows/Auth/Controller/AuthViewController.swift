//
//  AuthViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.07.2022.
//

import UIKit
import FirebaseCrashlytics

class AuthViewController: UIViewController {
    
    private var authView: AuthView {
        return self.view as! AuthView
    }
    
    
    let requestFactory = RequestFactory()
    
    // MARK: - Lifecycle
    

    
    override func loadView() {
        super.loadView()
        let view = AuthView()
        view.delegate = self
        self.view = view
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        authView.loginTexField.text = "Somebody" // заглушки для дебага
//        authView.passwordTexField.text = "mypassword"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - private func
    
    private func showError(_ errorMessage: String) {
        GALogger.logEvent(name: "login", key: "result", value: "failure")
        let alert = UIAlertController(title: "Ошибка авторизации",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func proceedToWelcomeScreen() {
        GALogger.logEvent(name: "login", key: "result", value: "success")
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
}

// MARK: - AuthViewProtocol
extension AuthViewController: AuthViewProtocol {
    
    func tapLoginButton(userName: String, password: String) {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: userName, password: password) { [weak self] response in
        
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    result.result == 1 ? self?.proceedToWelcomeScreen() : self?.showError(result.errorMessage ?? "Неизвестная ошибка.")
                    print(result)
                case .failure(let error):
                    self?.showError(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func tapRegistButton() {
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
}
