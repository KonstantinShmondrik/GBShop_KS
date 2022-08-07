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
    var product: GoodByldResult?
    
    let requestFactory = RequestFactory()
    
    
    // MARK: - Init
    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = ProductCardView()
        getGoodBtId(idProduct: productId)
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
                    self.product = result
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func showAddToBasketSuccessAlert() {
        let alert = UIAlertController(title: "Корзина", message: "Товар успешно добавлен в корзину.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ProductCardViewController: ProductCardViewProtocol {
    func tapGetReviewButton() {
        navigationController?.pushViewController(GetReviewTableViewController(productId: productId), animated: true)
    }
    
    func tapAddReviewButton() {
        navigationController?.pushViewController(AddReviewViewController(productId: productId), animated: true)
    }
    
    func tapInBasketButtonPressed() {
        guard let product = product else { return }
        let basket = requestFactory.makeBasketRequestFactory()
        let basketRequest = BasketRequest(idProduct: product.productId ?? 0, quantity: 1)
        basket.addToBasket(basket: basketRequest) { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    let item = AppBasketItem(productId: product.productId,
                                             productName: product.productName,
                                             price: product.price,
                                             picUrl: product.picUrl)
                    AppBasket.shared.items.append(item)
                    self.showAddToBasketSuccessAlert()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
