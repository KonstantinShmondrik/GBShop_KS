//
//  CatalogTableViewController.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 26.07.2022.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    let requestFactory = RequestFactory()
    var catalog: [ProductResult] = [ProductResult(idProduct: 123, productName: "jjjhhhhhhhhhhhhhhhhhhjjj", price: 788888, shortDescription: "ghghghghghghgh", picUrl: ""), ProductResult(idProduct: 123, productName: "jjjhhhhhhhhgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggghhhhhhhhhhjjj", price: 788888, shortDescription: "ghghghghghghgh", picUrl: "")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.reuseIdentifier)

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogTableViewCell.reuseIdentifier, for: indexPath) as? CatalogTableViewCell else {return UITableViewCell()}
       
        cell.configure(catalog[indexPath.row])
        
        return cell
    }
 
}
