//
//  ReviewTableView.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 02.08.2022.
//

import UIKit

class GetReviewTableViewController: UITableViewController {
    
    let requestFactory = RequestFactory()
    
    var reviews = [ReviewResult]()
    var productId: Int
    
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
        tableView.register(GetReviewTableViewCell.self, forCellReuseIdentifier: GetReviewTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        getReviews(idProduct: productId)
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GetReviewTableViewCell.reuseIdentifier, for: indexPath) as? GetReviewTableViewCell else {return UITableViewCell()}
        
        let review = reviews[indexPath.row]
        cell.configure(review)
        
        return cell
    }
    
    func getReviews(idProduct: Int) {
        let review = requestFactory.makeRewiewRequestFactory()
        
        review.getReviews(productId: idProduct) { response in
            switch response.result {
            case .success(let result):
                self.reviews = result
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

