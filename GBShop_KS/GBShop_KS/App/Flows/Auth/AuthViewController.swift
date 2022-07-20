//
//  AuthViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 20.07.2022.
//

import UIKit

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
//        view.backgroundColor = .gray
       
      
    }
    
    // MARK: - private func
    
    private func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func proceedToWelcomeScreen() {
        
        print("Вы смогли зайти")
//        let welcomeScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeScreenViewController") as! WelcomeScreenViewController
//        navigationController?.pushViewController(welcomeScreenViewController, animated: true)
    }

}

// MARK: - AuthViewProtocol
extension AuthViewController: AuthViewProtocol {
    func tapLoginButton(userName: String, password: String) {
       
        
        print("tapLoginButton \(userName) ==== \(password)")
        
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: userName, password: password) { response in
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
