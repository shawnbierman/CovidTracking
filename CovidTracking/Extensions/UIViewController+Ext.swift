//
//  UIViewController+Ext.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import SafariServices
import UIKit

extension UIViewController {
    
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        view.frame = self.view.bounds
        child.didMove(toParent: self)
    }
    
    
    func remove() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension UIViewController {
    
    func presentSafariVC(with url: URL) {
        present(SFSafariViewController(url: url), animated: true)
    }
    
}
