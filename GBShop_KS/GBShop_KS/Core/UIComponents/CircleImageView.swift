//
//  CircleView.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 26.07.2022.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.width / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.75,
                                    delay: 0,
                                    usingSpringWithDamping: 0.25,
                                    initialSpringVelocity: 0.75,
                                    options: [.allowUserInteraction],
                                    animations: {
                                        self.bounds = self.bounds.insetBy(dx: 20, dy: 20)
                                    },
                                    completion: nil)
    }

   

}
