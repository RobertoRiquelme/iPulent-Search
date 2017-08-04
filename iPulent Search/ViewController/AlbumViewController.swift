//
//  AlbumViewController.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/2/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import UIKit
import WebKit

class AlbumViewController: UIViewController, WKUIDelegate {

    //MODEL
    
    var albumURL: URL!{
        didSet {
            updateUI()
        }
    }
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
 
    }
    
    func updateUI(){
        let myRequest = URLRequest(url: albumURL)
        webView.load(myRequest)
    }
    
}
