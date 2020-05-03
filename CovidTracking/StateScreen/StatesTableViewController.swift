//
//  StatesTableViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesTableViewController: CommonTableViewController {

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
        let image = UIImage(systemName: !sorted ? buttons.0 : buttons.1)
        let sortButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(sortTable))
        
        navigationItem.rightBarButtonItems = [sortButton]
        
    }
    
    
    @objc func sortTable() {
        
        states.reverse()
        sorted.toggle()
        
    }
    
    
    @objc fileprivate func refreshData() {
        
        Service.shared.fetchAllStates(using: .states) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .failure(let error):
                
                dump(error)
                DispatchQueue.main.async { self.refreshControl?.endRefreshing() }
                
            case .success(let model):
                
                self.states = model.sorted(by: { $0.fullStateName! < $1.fullStateName! })
                DispatchQueue.main.async {
                    
                    self.sorted = false
                    self.refreshControl?.endRefreshing()
                    
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        states.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! StatesTableViewCell
            cell.configure(with: states[indexPath.row])
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let state = states[indexPath.row]
        let vc = StatesDetailViewController(state: state)
        navigationController?.pushViewController(vc, animated: true)

    }
}
