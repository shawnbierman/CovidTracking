//
//  NewsTableViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/22/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var articles = [Article]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News Articles"
        
        refreshData()

        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)

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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = articles[indexPath.row]

        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text? = model.publication ?? model.author ?? "Unknown"

        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let selectedArticle = articles[indexPath.row].url,
            let viewController = storyboard?.instantiateViewController(identifier: "ArticleViewController") as? ArticleViewController {
            viewController.articleURL = selectedArticle
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
}
