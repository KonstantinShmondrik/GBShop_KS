//
//  ProductCardView.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 31.07.2022.
//

import UIKit

protocol ProductCardViewProtocol: AnyObject {
    func tapInBasketButtonPressed()
    func tapGetReviewButton()
    func tapAddReviewButton()
}

class ProductCardView: UIView {
    
    // MARK: - Subviews
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = false
        
        
        return scrollView
    }()
    
    private(set) lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var picImage: UIImageView = {
        let image = UIImageView()
        image.sizeToFit()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private(set) lazy var inBasketButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("В корзину", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(inBasketButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private(set) lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Отзывы о товаре:"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var getReviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Посмотреть отзывы", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(getReviewButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private(set) lazy var addReviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Оставить отзыв", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(addReviewButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: ProductCardViewProtocol?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubview(self.scrollView)
        [self.productNameLabel,
         self.priceLabel,
         self.picImage,
         self.descriptionLabel,
         self.inBasketButton,
         self.reviewsLabel,
         self.getReviewButton,
         self.addReviewButton
        ].forEach() {
            self.scrollView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            self.scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 0.0),
            self.scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,constant: 0.0),
            self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: 0.0),
            
            self.productNameLabel.topAnchor.constraint(lessThanOrEqualTo: self.scrollView.topAnchor, constant: 10),
            self.productNameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10),
            self.productNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            self.picImage.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 10.0),
            self.picImage.heightAnchor.constraint(equalToConstant: 300.0),
            self.picImage.widthAnchor.constraint(equalToConstant: 300.0),
            self.picImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.picImage.bottomAnchor, constant: 10),
            self.descriptionLabel.leftAnchor.constraint(equalTo: productNameLabel.leftAnchor),
            self.descriptionLabel.rightAnchor.constraint(equalTo: productNameLabel.rightAnchor),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20),
            self.priceLabel.leftAnchor.constraint(equalTo: productNameLabel.leftAnchor),
            self.priceLabel.rightAnchor.constraint(equalTo: productNameLabel.rightAnchor),
            
            self.inBasketButton.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 20.0),
            self.inBasketButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.inBasketButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.inBasketButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.reviewsLabel.topAnchor.constraint(equalTo: self.inBasketButton.bottomAnchor, constant: 20),
            self.reviewsLabel.leftAnchor.constraint(equalTo: productNameLabel.leftAnchor),
            self.reviewsLabel.rightAnchor.constraint(equalTo: productNameLabel.rightAnchor),
            
            self.getReviewButton.topAnchor.constraint(equalTo: self.reviewsLabel.bottomAnchor, constant: 20.0),
            self.getReviewButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.getReviewButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.getReviewButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.addReviewButton.topAnchor.constraint(equalTo: self.getReviewButton.bottomAnchor, constant: 20.0),
            self.addReviewButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.addReviewButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.addReviewButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
        ])
    }
    
    // MARK: - configure
    
    func configure(_ item: GoodByldResult) {
        productNameLabel.text = item.productName ?? ""
        descriptionLabel.text = item.description ?? ""
        if let itemPrice = item.price {
            priceLabel.text = "\(itemPrice.formattedString) ₽"
        } else {
            priceLabel.text = "Нет в наличии"
        }
        if let picUrl = item.picUrl, let itemUrl = URL(string: picUrl) {
            picImage.sd_setImage(with: itemUrl)
        } else {
            picImage.image = UIImage(named: "noPhoto")
        }
    }
    
    // MARK: - Actions
    
    @objc private func inBasketButtonPressed() {
        delegate?.tapInBasketButtonPressed()
    }
    
    @objc private func getReviewButtonPressed() {
        delegate?.tapGetReviewButton()
    }
    
    @objc private func addReviewButtonPressed() {
        delegate?.tapAddReviewButton()
    }

}

