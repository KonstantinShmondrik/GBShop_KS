//
//  CatalogTableViewCell.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 26.07.2022.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "reuseId"
    
    // MARK: - Outlet
    
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
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var picImage: CircleImageView = {
        let image = CircleImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
    
        self.contentView.addSubview(self.productNameLabel)
        self.contentView.addSubview(self.picImage)
        self.contentView.addSubview(self.shortDescriptionLabel)
        self.contentView.addSubview(self.priceLabel)
        
        NSLayoutConstraint.activate([
           

            self.productNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.productNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.productNameLabel.widthAnchor.constraint(equalToConstant: 250.0),
            self.productNameLabel.heightAnchor.constraint(equalToConstant: 100.0),
           
            self.picImage.centerYAnchor.constraint(equalTo: self.productNameLabel.centerYAnchor),
            
            self.picImage.leftAnchor.constraint(equalTo: self.productNameLabel.rightAnchor, constant: 10.0),
            self.picImage.widthAnchor.constraint(equalToConstant: 80.0),
            self.picImage.heightAnchor.constraint(equalToConstant: 80.0),
            self.picImage.centerYAnchor.constraint(equalTo: self.productNameLabel.centerYAnchor),
           
            self.shortDescriptionLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 10.0),
            self.shortDescriptionLabel.leftAnchor.constraint(equalTo: self.productNameLabel.leftAnchor),
            self.shortDescriptionLabel.rightAnchor.constraint(equalTo: self.picImage.rightAnchor),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.shortDescriptionLabel.bottomAnchor, constant: 10),
            self.priceLabel.leftAnchor.constraint(equalTo: self.shortDescriptionLabel.leftAnchor),
            self.priceLabel.rightAnchor.constraint(equalTo: self.shortDescriptionLabel.rightAnchor),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
        
    }
    
    // MARK: - configure
    
    func configure(_ item: ProductResult) {
        productNameLabel.text = item.productName
        shortDescriptionLabel.text = item.shortDescription
        if let itemPrice = item.price {
        priceLabel.text = "\(itemPrice.formattedString) ₽"
        } else {
            priceLabel.text = "Нет в наличии"
        }
        
        picImage.image = UIImage(named: "noPhoto")
        
        
        
        
        
        
//        itemNameLabel.text = item.productName ?? "Х/З"
//        itemDescriptionLabel.text = item.shortDescription ?? "Х/З"
//        if let itemPrice = item.price {
//            itemPriceLabel.text = "\(itemPrice.formattedString) ₽"
//        } else {
//            itemPriceLabel.text = "Х/З"
//        }
        
        
//        if let picUrl = item.picUrl, let itemUrl = URL(string: picUrl) {
//            itemPicture.af.setImage(withURL: itemUrl)
//        }
    }
    
}
