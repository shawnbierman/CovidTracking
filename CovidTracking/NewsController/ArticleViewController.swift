//
//  ArticleViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    var articleURL: String?

    @IBOutlet var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()

        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let urlString = articleURL else { return }

        webView.load(URLRequest(url: URL(string: urlString)!))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webView.stopLoading()
    }
}
