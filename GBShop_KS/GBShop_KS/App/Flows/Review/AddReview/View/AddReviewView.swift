//
//  AddReviewView.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 02.08.2022.
//

import UIKit

protocol AddReviewViewProtocol: AnyObject {
    func tapSaveReviewButton(reviewResult: ReviewResult)
}

class AddReviewView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var reviewField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Оставте ваш отзыв о товаре", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var saveReviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Сохранить", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(saveReviewButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: AddReviewViewProtocol?
    
    private var IdProduct = 0
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupControls()
        self.registerNotifications()
        self.hideKeyboardGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        [self.reviewField, self.saveReviewButton].forEach() {
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            self.reviewField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            self.reviewField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 10.0),
            self.reviewField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: -10.0),
            self.reviewField.heightAnchor.constraint(equalToConstant: 200.0),
            
            self.saveReviewButton.topAnchor.constraint(equalTo: self.reviewField.bottomAnchor, constant: 20.0),
            self.saveReviewButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.saveReviewButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.saveReviewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
    // MARK: - config
    
    func config(IdProduct: Int) {
        self.IdProduct = IdProduct
    }
    
    // MARK: - private func
    
    private func setupControls() {
        saveReviewButton.backgroundColor = UIColor.opaqueSeparator
        saveReviewButton.isEnabled = false
        
        [reviewField].forEach {
            $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
    }
    
    private func isFormFilled() -> Bool {
        guard reviewField.text != "" else {
            return false
        }
        return true
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func hideKeyboardGesture() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        self.addGestureRecognizer(hideKeyboardGesture)
    }
    // MARK: - Actions
    
    @objc private func saveReviewButtonPressed() {
        
        delegate?.tapSaveReviewButton(reviewResult: ReviewResult(userId: 123, reviewText: reviewField.text ?? "", productId: IdProduct))
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.convert(keyboardFrame, from: nil)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let _: UIEdgeInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard isFormFilled() else {
            saveReviewButton.backgroundColor = UIColor.opaqueSeparator
            saveReviewButton.isEnabled = false
            return
        }
        saveReviewButton.backgroundColor = .white
        saveReviewButton.isEnabled = true
    }
    
}
