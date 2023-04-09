//
//  ReviewTableViewCell.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 02.08.2022.
//

import UIKit

class GetReviewTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "reuseIdentifier"
    
    // MARK: - Outlet
    
    private(set) lazy var userIDLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private(set) lazy var reviewTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        [self.reviewTextLabel, self.userIDLabel].forEach() {
            self.contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.userIDLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.userIDLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            self.userIDLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            
            self.reviewTextLabel.topAnchor.constraint(equalTo: self.userIDLabel.bottomAnchor, constant: 15),
            self.reviewTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            self.reviewTextLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.reviewTextLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    // MARK: - configure
    
    func configure(_ item: ReviewResult) {
        reviewTextLabel.text = item.reviewText ?? ""
        userIDLabel.text = "Отзыв покупателя: \(String(describing: item.userId ?? 0) )"
    }
    
}
