//
//  StatesTableViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesTableViewController: CommonTableViewController {

    let cellReuseIdentifier = "stateCell"
    
    var states = [State]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    var sorted: Bool = false {
        didSet {
            configureNavButton()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(StatesTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        configureRefreshControl(with: #selector(refreshData))
        configureNavButton()
        refreshData()
    }
    
    
    private func configureNavButton() {
        
        let buttons = ("arrow.up.arrow.down.square", "arrow.up.arrow.down.square.fill")
        let sortButton = UIBarButtonItem(image: UIImage(systemName: !sorted ? buttons.0 : buttons.1),
                                         style: .plain, target: self, action: #selector(sortTable))
        
        navigationItem.rightBarButtonItems = [sortButton]
        
    }
    
    @objc func sortTable() {
        
        states.sort(by: sorted ? { $0.state < $1.state } : { $0.state > $1.state })
        sorted.toggle()
        
    }
    
    @objc fileprivate func refreshData() {
        
        Service.shared.fetchAllStates(api: "https://covidtracking.com/api/states") { [weak self] (result) in
            
            switch result {
                
            case .failure(let error):
                
                dump(error)
                
                self?.refreshControl?.endRefreshing()
                
            case .success(let model):
               
                self?.states = model.sorted(by: { $0.state < $1.state })
                
                DispatchQueue.main.async {
                    self?.refreshControl?.endRefreshing()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        states.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let model = states[indexPath.row]
        let positives = model.positive?.formatNumber(as: .decimal) ?? "0"
        let state = model.state
        
        cell.textLabel?.text = statesDictionary[state]
        cell.detailTextLabel?.text = positives
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = StatesDetailViewController()
        let state = states[indexPath.row]
        vc.state = state
        navigationController?.pushViewController(vc, animated: true)

    }
}
