//
//  RegisterVendorVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 11/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//


import WebKit


class RegisterVendorVC: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          webView = WKWebView()
              webView.navigationDelegate = self
              view = webView
              
              let url = URL(string: "https://www.bawabtalsharq.com/index.php?dispatch=companies.apply_for_vendor")!
              webView.load(URLRequest(url: url))
              
              let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
              toolbarItems = [refresh]
              navigationController?.isToolbarHidden = false
    }
        
      
        
        
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    
}
