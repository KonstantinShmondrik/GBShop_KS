//
//  EditDataViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 23.07.2022.
//

import UIKit

class EditDataViewController: UIViewController {
    
    let user = User(id: 123,
                    login: "Somebody",
                    password: "mypassword",
                    email: "some@some.ru",
                    gender: "f",
                    creditCard: "9872389-2424-234224-234",
                    bio: "This is good! I think I will switch to another language",
                    name: "John",
                    lastname: "Doe")
    
    
    
    private var authView: EditDataView {
        return self.view as! EditDataView
    }
    
    let requestFactory = RequestFactory()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        navigationController?.isNavigationBarHidden = true
        let view = EditDataView()
        view.config(user: user)
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    private func warningSavedEditUserData(user: User) {
        let alert = UIAlertController(title: "",
                                      message: "Вы уверены, что хотите сохранить изменения?",
                                      preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Да",
                                      style: .cancel,
                                      handler: {action in
            let changeUserData = self.requestFactory.makeСhangeUserDataFactory()
            
            changeUserData.changeUserData(user: user) { [weak self] response in
                DispatchQueue.main.async {
                    switch response.result {
                    case .success(let result):
                        result.result == 1 ? self?.savedEditUserData() : self?.showError(result.errorMessage ?? "Неизвестная ошибка.")
                        print(result)
                    case .failure(let error):
                        self?.showError(error.localizedDescription)
                        print(error.localizedDescription)
                    }
                }
            }
            self.dismiss(animated: true, completion: nil)})
        
        let actionNo = UIAlertAction(title: "Нет",
                                     style: .default,
                                     handler: { _ in self.loadView()})
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.present(alert, animated: true,completion: nil)
    }
    
    private func savedEditUserData() {
        let alert = UIAlertController(title: "Поздравляем!" ,
                                      message: "Ваши данные изменены.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func warningLogout(user: User) {
        let alert = UIAlertController(title: "",
                                      message: "Вы уверены, что хотите выйти?",
                                      preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Да",
                                      style: .cancel,
                                      handler: {action in
            let auth = self.requestFactory.makeAuthRequestFactory()
            auth.logout(userID: user.id ?? 0) { [weak self] response in
                DispatchQueue.main.async {
                    switch response.result {
                    case .success(let result):
                        result.result == 1 ? self?.logOut() : self?.showError(result.errorMessage ?? "Неизвестная ошибка.")
                        print(result)
                    case .failure(let error):
                        self?.showError(error.localizedDescription)
                        print(error.localizedDescription)
                    }
                }
            }
            self.dismiss(animated: true, completion: nil)})
        
        let actionNo = UIAlertAction(title: "Нет",
                                     style: .default,
                                     handler: nil)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.present(alert, animated: true,completion: nil)
    }
    
    private func logOut() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension EditDataViewController: EditDataViewProtocol {
    func tapSaveButton(user: User) {
        self.warningSavedEditUserData(user: user)
    }
    
    func tapLogoutButton() {
        self.warningLogout(user: self.user)
    }
}

