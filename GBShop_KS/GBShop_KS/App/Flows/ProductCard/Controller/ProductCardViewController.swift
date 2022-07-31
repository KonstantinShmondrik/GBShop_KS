//
//  ProductCardViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 31.07.2022.
//

import UIKit

class ProductCardViewController: UIViewController {
    
    private var productCardView: ProductCardView {
        return self.view as! ProductCardView
    }
    
    var productId: Int
//    var goodByld: GoodByldResult = GoodByldResult(result: nil,
//                                                  productName: nil,
//                                                  price: nil,
//                                                  description: nil,
//                                                  productId: nil,
//                                                  picUrl: nil)
    let requestFactory = RequestFactory()
    
    
    
    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = ProductCardView()
        getGoodBtId(idProduct: productId)
//        view.configure(goodByld)
        view.delegate = self
        self.view = view


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationItem.hidesBackButton = false
    }
    
    func getGoodBtId(idProduct: Int) {
    let GoodByld = requestFactory.makeGetGoodByldRequestFactory()
        GoodByld.getGoodByld(productId: idProduct) { response in
            DispatchQueue.main.async {
                    switch response.result {
                    case .success(let result):
                        print(result)
                        self.productCardView.configure(result)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
    
}

extension ProductCardViewController: ProductCardViewProtocol {
    func tapInBasketButtonPressed() {
       print( "Нажата кнопка в корзину")
        print(productId)
    }
    
    
    
}
