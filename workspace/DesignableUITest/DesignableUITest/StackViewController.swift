//
//  StackViewController.swift
//  DesignableUITest
//
//  Created by snowman on 2017/02/20.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //閉じるボタンのアクション
    @IBAction func actionCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
