//
//  BasretTableViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.08.2022.
//

import UIKit

class BasketTableViewController: UITableViewController {

    let requestFactory = RequestFactory()
//    var catalog: CatalogResult = CatalogResult(pageNumber: 0, products: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BascetTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        navigationController?.navigationBar.isTranslucent = true
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Table view data source
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if AppBasket.shared.items.count == 0 {
            return 1
        } else {
//            totalLabel.text = "\(AppBasket.shared.items.count) товаров на сумму \(AppBasket.shared.items.map{ $0.price! }.reduce(0, +).formattedString) ₽"
            return AppBasket.shared.items.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if AppBasket.shared.items.count == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Корзина пуста"
            self.tableView.tableFooterView = nil
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: BascetTableViewCell.reuseIdentifier) as? BascetTableViewCell
            cell?.configure(AppBasket.shared.items[indexPath.row])
            cell?.delegate = self
            cell?.row = indexPath.row
            
            return cell ?? UITableViewCell()
        }
    }
    
}

extension BasketTableViewController: BascetTableViewCellProtocol {
    func deleteItem(_ index: Int) {
        guard let itemName = AppBasket.shared.items[index].productName else { return }
        let basketFactory = requestFactory.makeBasketRequestFactory()
       
        let request = BasketRequest(idProduct: index, quantity: 1)
        
        let alert = UIAlertController(title: "Корзина", message: "Вы действительно хотите удалить \(itemName) из корзины?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { _ in
            AppBasket.shared.items.remove(at: index)
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .default, handler: nil))
        
        basketFactory.deleteFromBasket(basket: request)  { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let error): print(error.localizedDescription)
            }
        }
        
    }
}