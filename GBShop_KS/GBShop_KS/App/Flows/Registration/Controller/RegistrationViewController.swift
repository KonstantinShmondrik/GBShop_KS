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
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationItem.hidesBackButton = false
    }
    
    // MARK: - private func
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func proceedToWelcomeScreen() {
        let alert = UIAlertController(title: "Поздравляем! Вы зарегестрированны." ,
                                      message: "Пройдите обратно и войдите в приложение при помощи вашего логина и пароля",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

extension RegistrationViewController: RegistViewProtocol {
    func tapRegistButton(user: User) {
        let regist = requestFactory.makeRegistRequestFactory()
        
        regist.register(user: user) {response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    result.result == 1 ? self.proceedToWelcomeScreen() : self.showError(result.errorMessage ?? "Неизвестная ошибка.")
                    print(result)
                case .failure(let error):
                    self.showError(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
}





