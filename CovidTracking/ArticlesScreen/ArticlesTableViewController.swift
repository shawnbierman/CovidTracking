//
//  ArticlesTableViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class ArticlesTableViewController: CommonTableViewController {

    let cellReuseIdentifier = "articleCell"
    
    
    var articles = [Article]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        configureRefreshControl(with: #selector(refreshData))
        refreshData()
    }

    
    @objc fileprivate func refreshData() {
        
        Service.shared.fetchAllArticles(api: "https://covidtracking.com/api/press") { [weak self] (result) in
            
            switch result {
                
            case .failure(let error):
                
                dump(error)
                
                self?.refreshControl?.endRefreshing()
                
            case .success(let model):
                
                self?.articles = model
                
                DispatchQueue.main.async {
                    self?.refreshControl?.endRefreshing()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ArticleTableViewCell
        
        let article = articles[indexPath.row]
        
        cell.configure(with: article)
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = articles[indexPath.row].url {
            presentSafariVC(with: URL(string: url)!)
        }
    }
}
