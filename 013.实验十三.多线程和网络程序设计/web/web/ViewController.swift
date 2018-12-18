//
//  ViewController.swift
//  web
//
//  Created by 509 on 2018/12/13.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var urltf: UITextField!
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:"http://www.baidu.com"){
        webview.load(URLRequest(url: url))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func go(_ sender: Any) {
        if let url = URL(string: urltf.text ?? "") {
            webview.load(URLRequest(url: url))
        }
    }
    @IBAction func Forward(_ sender: Any) {
        webview.goForward()
    }
    @IBAction func Back(_ sender: Any) {
        webview.goBack()
    }
    
    @IBAction func Relaod(_ sender: Any) {
        webview.reload()
    }
}

