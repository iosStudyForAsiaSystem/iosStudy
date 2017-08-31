//
//  ViewController.swift
//  rinkaiWeb
//
//  Created by snowman on 2017/08/29.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        loadLocalWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLocalWebView() {
        // Load local html file into web view
        let myProjectBundle:Bundle = Bundle.main;
        
        let filePath:String = myProjectBundle.path(forResource: "1708rinkai_enq", ofType: "html")!
        
        let myURL = NSURL(string: filePath);
        let myURLRequest:NSURLRequest = NSURLRequest(url: myURL! as URL);
        
        webView.loadRequest(myURLRequest as URLRequest)
    }

}

extension ViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        myActivityIndicator.stopAnimating()
    }

}
