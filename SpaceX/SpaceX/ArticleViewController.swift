//
//  ArticleViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import UIKit
import WebKit

final class ArticleViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var articleUrl: String

    init(articleUrl: String) {
        self.articleUrl = articleUrl
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: articleUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
