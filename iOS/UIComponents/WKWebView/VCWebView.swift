//
//  VCWebView.swift
//  iOS
//
//  Created by Shubham Jitiya on 10/05/23.
//

import UIKit
import WebKit

class VCWebView: UIViewController {
    // MARK: Variables
    private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: IB outlets
    @IBOutlet weak var wkWebView: WKWebView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCWebView {
    private func initialSetup() {
        wkWebView.navigationDelegate = self
        addActivityIndicator()
        loadURL()
    }
    
    private func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    private func loadURL() {
        guard let url = URL(string: "https://www.google.com/") else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            self.wkWebView.load(URLRequest(url: url))
        }
        
        wkWebView.allowsBackForwardNavigationGestures = true
    }
}

// MARK: Functions
extension VCWebView: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
