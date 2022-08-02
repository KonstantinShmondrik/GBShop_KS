//
//  AddReviewViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 02.08.2022.
//

import UIKit

class AddReviewViewController: UIViewController {
    
    private var addReviewView: AddReviewView {
        return self.view as! AddReviewView
    }
    
    let requestFactory = RequestFactory()
    var productId: Int
    
    // MARK: - Init
    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecyclea
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = AddReviewView()
        view.config(IdProduct: productId)
        view.delegate = self
        self.view = view
        
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
    
    private func proceedToWelcomeScreen(message: String) {
        let alert = UIAlertController(title: "Все хоро" ,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - AuthViewProtocol
extension AddReviewViewController: AddReviewViewProtocol {
    func tapSaveReviewButton(reviewResult: ReviewResult) {
        let review = requestFactory.makeRewiewRequestFactory()
        review.addReview(review: reviewResult) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    result.result == 1 ? self.proceedToWelcomeScreen(message: result.successMessage ?? "") : self.showError(result.errorMessage ?? "Неизвестная ошибка.")
                    print(result)
                case .failure(let error):
                    self.showError(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}

