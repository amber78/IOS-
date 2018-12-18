//
//  ViewController.swift
//  2
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {


    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var urltf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:"http://www.baidu.com"){
            webview.load(URLRequest(url: url))
        }
    }
    
    @IBAction func back(_ sender: Any) {
        webview.goBack()
    }
    @IBAction func forward(_ sender: Any){
        webview.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webview.reload()
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: urltf.text ?? "") {
            webview.load(URLRequest(url: url))
        }
    }
}
