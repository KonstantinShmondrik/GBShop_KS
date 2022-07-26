//
//  CatalogTableViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 26.07.2022.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    let requestFactory = RequestFactory()
    var catalog: CatalogResult = CatalogResult(pageNumber: 0, products: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        getCatalog(pageNumber: 1, categoryId: 1) 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogTableViewCell.reuseIdentifier, for: indexPath) as? CatalogTableViewCell else {return UITableViewCell()}
        
        cell.configure(catalog.products[indexPath.row])
        
        return cell
    }
    
    func getCatalog(pageNumber: Int, categoryId: Int) {
        let catalog = requestFactory.makeGetCatalogRequestFactory()
        
        catalog.getCatalog(pageNumber: pageNumber,
                           categoryId: categoryId) { response in
            switch response.result {
            case .success(let result):
                self.catalog = result
                print(result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
