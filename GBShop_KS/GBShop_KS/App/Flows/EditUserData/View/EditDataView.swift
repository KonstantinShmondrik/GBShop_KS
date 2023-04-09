//
//  EditDataView.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 23.07.2022.
//

import UIKit
import FirebaseCrashlytics

protocol EditDataViewProtocol: AnyObject {
    func tapSaveButton(user: User)
    func tapLogoutButton()
}

class EditDataView: UIView {
    
    // MARK: - Subviews
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = false
        
        return scrollView
    }()
    
    private(set) lazy var hederLabel: UILabel = {
        let label = UILabel()
        label.text = "Редактирование данных пользователя"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var loginTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var passwordTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваше имя:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var nameTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Ваше имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var lastnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша фамилия:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var lastnameTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Ваша фамилия", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Электронная почта:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var emailTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Электронная почта", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var genderSegmentedControl: UISegmentedControl = {
        let items = ["👨🏻","👩🏻"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = .gray
        segmentControl.selectedSegmentTintColor = .blue
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentControl
    }()
    
    private(set) lazy var creditCardLabel: UILabel = {
        let label = UILabel()
        label.text = "Кредитная карта:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var creditCardTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "Кредитная карта", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "расскажите о себе:"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var bioTexField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.attributedPlaceholder = NSAttributedString(string: "О себе", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private(set) lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Сохранить", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private(set) lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 16.0
        button.setTitle("Выйти", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: EditDataViewProtocol?
    
    // MARK: - Config func
    
    func config(user: User) {
        loginTexField.text = user.login
        passwordTexField.text = user.password
        nameTexField.text = user.name
        lastnameTexField.text = user.lastname
        emailTexField.text = user.email
        creditCardTexField.text = user.creditCard
        bioTexField.text = user.bio
        
        switch user.gender {
        case "m":
            genderSegmentedControl.selectedSegmentIndex = Int(0)
        case "f":
            genderSegmentedControl.selectedSegmentIndex = Int(1)
        default:
            genderSegmentedControl.selectedSegmentIndex = Int(0)
        }
    }
    
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
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.hederLabel)
        self.scrollView.addSubview(self.loginLabel)
        self.scrollView.addSubview(self.loginTexField)
        self.scrollView.addSubview(self.passwordLabel)
        self.scrollView.addSubview(self.passwordTexField)
        self.scrollView.addSubview(self.nameLabel)
        self.scrollView.addSubview(self.nameTexField)
        self.scrollView.addSubview(self.lastnameLabel)
        self.scrollView.addSubview(self.lastnameTexField)
        self.scrollView.addSubview(self.emailLabel)
        self.scrollView.addSubview(self.emailTexField)
        self.scrollView.addSubview(self.genderSegmentedControl)
        self.scrollView.addSubview(self.creditCardLabel)
        self.scrollView.addSubview(self.creditCardTexField)
        self.scrollView.addSubview(self.bioLabel)
        self.scrollView.addSubview(self.bioTexField)
        self.scrollView.addSubview(self.saveButton)
        self.scrollView.addSubview(self.logoutButton)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            self.scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 0.0),
            self.scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: 0.0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: 0.0),
            
            self.hederLabel.topAnchor.constraint(lessThanOrEqualTo: self.scrollView.topAnchor, constant: 20),
            self.hederLabel.heightAnchor.constraint(equalToConstant: 50.0),
            self.hederLabel.widthAnchor.constraint(equalToConstant: 400.0),
            self.hederLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.hederLabel.bottomAnchor, constant: 10.0),
            self.loginLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.loginLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.loginTexField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 8.0),
            self.loginTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.loginTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.loginTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.loginTexField.bottomAnchor, constant: 10.0),
            self.passwordLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.passwordLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.passwordLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.passwordTexField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 8.0),
            self.passwordTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.passwordTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.passwordTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            
            self.nameLabel.topAnchor.constraint(equalTo: self.passwordTexField.bottomAnchor, constant: 30.0),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.nameTexField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8.0),
            self.nameTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.nameTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.nameTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.lastnameLabel.topAnchor.constraint(equalTo: self.nameTexField.bottomAnchor, constant: 10.0),
            self.lastnameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.lastnameLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.lastnameLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.lastnameTexField.topAnchor.constraint(equalTo: self.lastnameLabel.bottomAnchor, constant: 8.0),
            self.lastnameTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.lastnameTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.lastnameTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.lastnameTexField.bottomAnchor, constant: 8.0),
            self.emailLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.emailLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.emailLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.emailTexField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 8.0),
            self.emailTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.emailTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.emailTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.genderSegmentedControl.topAnchor.constraint(equalTo: self.emailTexField.bottomAnchor, constant: 10.0),
            self.genderSegmentedControl.heightAnchor.constraint(equalToConstant: 50.0),
            self.genderSegmentedControl.widthAnchor.constraint(equalToConstant: 350.0),
            self.genderSegmentedControl.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.creditCardLabel.topAnchor.constraint(equalTo: self.genderSegmentedControl.bottomAnchor, constant: 10.0),
            self.creditCardLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.creditCardLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.creditCardLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.creditCardTexField.topAnchor.constraint(equalTo: self.creditCardLabel.bottomAnchor, constant: 8.0),
            self.creditCardTexField.heightAnchor.constraint(equalToConstant: 50.0),
            self.creditCardTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.creditCardTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.bioLabel.topAnchor.constraint(equalTo: self.creditCardTexField.bottomAnchor, constant: 10.0),
            self.bioLabel.heightAnchor.constraint(equalToConstant: 20.0),
            self.bioLabel.widthAnchor.constraint(equalToConstant: 350.0),
            self.bioLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.bioTexField.topAnchor.constraint(equalTo: self.bioLabel.bottomAnchor, constant: 8.0),
            self.bioTexField.heightAnchor.constraint(equalToConstant: 150.0),
            self.bioTexField.widthAnchor.constraint(equalToConstant: 350.0),
            self.bioTexField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.saveButton.topAnchor.constraint(equalTo: self.bioTexField.bottomAnchor, constant: 30.0),
            self.saveButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.saveButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.saveButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.logoutButton.topAnchor.constraint(equalTo: self.saveButton.bottomAnchor, constant: 20.0),
            self.logoutButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.logoutButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.logoutButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
        ])
        
    }
    
    // MARK: - private func
    
    private func setupControls() {
        saveButton.backgroundColor = UIColor.opaqueSeparator
        saveButton.isEnabled = false
        
        [loginTexField, passwordTexField, nameTexField, lastnameTexField, emailTexField, creditCardTexField, bioTexField].forEach {
            $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
    }
    
    private func isFormFilled() -> Bool {
        guard nameTexField.text != "",
              lastnameTexField.text != "",
              emailTexField.text != "",
              loginTexField.text != "",
              passwordTexField.text != "" else {
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
        
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    // MARK: - Actions
    
    @objc private func saveButtonPressed() {
        let user = User(login: loginTexField.text ?? "",
                        password: passwordTexField.text ?? "",
                        email: emailTexField.text ?? "",
                        gender: genderSegmentedControl.selectedSegmentIndex == 0 ? "m" : "f",
                        creditCard: creditCardTexField.text ?? "",
                        bio: bioTexField.text ?? "",
                        name: nameTexField.text ?? "",
                        lastname: lastnameTexField.text ?? "")
        
        delegate?.tapSaveButton(user: user)
        
    }
    
    @objc private func logoutButtonPressed() {
        delegate?.tapLogoutButton()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {
            Crashlytics.crashlytics().log("userInfo is nil!")
            return }
        
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        
        keyboardFrame = self.scrollView.convert(keyboardFrame, from: nil)
        
        contentInset.bottom = keyboardFrame.size.height + 50
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard isFormFilled() else {
            saveButton.backgroundColor = UIColor.opaqueSeparator
            saveButton.isEnabled = false
            return
        }
        saveButton.backgroundColor = .blue
        saveButton.isEnabled = true
    }
    
}
