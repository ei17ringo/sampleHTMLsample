//
//  ViewController.swift
//  sampleHTML
//
//  Created by Tsukasa Chinen on 2017/11/23.
//  Copyright © 2017年 Tsukasa Chinen. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        /* Load: Local HTML */
        
        
        
        var script = "function datatest() {window.location =　'hoge://saveFunc?color=aaaa';}"
        myWebView.stringByEvaluatingJavaScript(from: script)
        
        let htmlPath = Bundle.main.path(forResource: "test", ofType: "html")
        let url = URL(fileURLWithPath:htmlPath!)
        let urlRequest = URLRequest(url: url)
        myWebView.loadRequest(urlRequest)
        myWebView.delegate = self

    } /* END: viewDidLoad */

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
            if request.url!.scheme == "hoge" {
                print("hoge")
                return false
            }
   
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

