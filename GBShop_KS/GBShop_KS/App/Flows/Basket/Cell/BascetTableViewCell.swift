//
//  BascetTableViewCell.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.08.2022.
//

import UIKit

protocol BascetTableViewCellProtocol: AnyObject {
    func deleteItem(_ index: Int)
}

class BascetTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "reuseId"
    var delegate: BascetTableViewCellProtocol?
    var row: Int?
    
    // MARK: - Outlet
    
    private(set) lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private(set) lazy var picImage: CircleImageView = {
        let image = CircleImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private(set) lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        //        button.backgroundColor = .blue
        button.setImage(UIImage(systemName: "trash", withConfiguration: .none), for: .normal)
        button.tintColor = .black
        //        button.setTitle("В корзину", for: .normal)
        //        button.clipsToBounds = true
        //        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .gray
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        
        [self.productNameLabel,
         self.picImage,
         self.priceLabel,
         self.deleteButton
        ].forEach() {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            self.productNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.productNameLabel.leadingAnchor.constraint(equalTo: self.picImage.trailingAnchor, constant: 10),
            self.productNameLabel.widthAnchor.constraint(equalToConstant: 200.0),
            self.productNameLabel.heightAnchor.constraint(equalToConstant: 100.0),
            
            self.picImage.centerYAnchor.constraint(equalTo: self.productNameLabel.centerYAnchor),
            self.picImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            self.picImage.widthAnchor.constraint(equalToConstant: 80.0),
            self.picImage.heightAnchor.constraint(equalToConstant: 80.0),
            self.picImage.centerYAnchor.constraint(equalTo: self.productNameLabel.centerYAnchor),
            
            self.deleteButton.centerYAnchor.constraint(equalTo: self.productNameLabel.centerYAnchor),
            self.deleteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.deleteButton.widthAnchor.constraint(equalToConstant: 40.0),
            self.deleteButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 10),
            self.priceLabel.leftAnchor.constraint(equalTo: self.productNameLabel.leftAnchor),
            self.priceLabel.rightAnchor.constraint(equalTo: self.productNameLabel.rightAnchor),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
    }
    
    // MARK: - configure
    
    func configure(_ item: AppBasketItem) {
        productNameLabel.text = item.productName
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
    
    @objc private func deleteButtonPressed() {
        delegate?.deleteItem(row ?? 0)
    }
    
    
}
