//
//  WebViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/06/07.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var webview: UIWebView!
    
    var urlString: String = "http://public.ais-info.co.jp/~mcpc/indexForApp.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        
        let urlInfo : URL = URL(string: urlString)!
        webview.loadRequest(URLRequest.init(url: urlInfo))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIWebViewDelegate
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
 
    public func webViewDidStartLoad(_ webView: UIWebView) {
        indicatorView.startAnimating()
    }
    
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        indicatorView.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
