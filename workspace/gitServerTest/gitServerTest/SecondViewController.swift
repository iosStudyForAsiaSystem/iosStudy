//
//  SecondViewController.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modalAction(_ sender: UIButton) {

        let viewController = UIViewController()
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.view.backgroundColor = UIColor.red
        let naviVc = UINavigationController()
        naviVc.addChildViewController(viewController)
        
        present(naviVc, animated: true, completion: nil)
        
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dismissVc()
        }
        
    }
    
    func dismissVc () {
        dismiss(animated: true, completion: {
            [presentingViewController] () -> Void in
            // 閉じた時に行いたい処理
            presentingViewController?.viewWillAppear(true)
        })
    }
}

