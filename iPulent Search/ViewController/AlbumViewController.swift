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
    
    var albumURL: URL!
    
    @IBOutlet weak var uiNavigationBar: UINavigationItem!
    var webView: WKWebView!
    
    override func loadView() {

        webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.uiDelegate = self
        view = webView
    }
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Album Detail"
        updateUI()
    }
    
    func updateUI(){
        webView.load(URLRequest(url: albumURL))
    }
    
}
