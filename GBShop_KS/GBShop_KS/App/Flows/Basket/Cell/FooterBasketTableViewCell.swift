//
//  FooterTableViewCell.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.08.2022.
//

import UIKit

protocol FooterBasketTableViewCellProtocol: AnyObject {
    func pressPayButton()
}

class FooterBasketTableViewCell: UITableViewHeaderFooterView {
    static let reuseIdentifier = "reuseId"
    var delegate: FooterBasketTableViewCellProtocol?
    
    // MARK: - Outlet
    
    private(set) lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        
        return label
    }()
 
    
    private(set) lazy var payButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Оформить покупку", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(payBasketButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        
        [self.totalLabel,
         self.payButton
        ].forEach() {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.totalLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.totalLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            self.payButton.topAnchor.constraint(equalTo: self.totalLabel.bottomAnchor, constant: 20.0),
            self.payButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.payButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.payButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.payButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
    }
    
    // MARK: - configure
    
    func configure() {
        if AppBasket.shared.items.count == 0 {
            self.isHidden = true
        } else {
            self.isHidden = false
        totalLabel.text = "\(AppBasket.shared.items.count) товаров на сумму \(AppBasket.shared.items.map{ $0.price! }.reduce(0, +).formattedString) ₽"
    }
    }

    // MARK: - Actions
    
    @objc private func payBasketButtonPressed() {
        delegate?.pressPayButton()
    }
    
    

}
