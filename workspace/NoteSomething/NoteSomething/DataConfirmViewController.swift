//
//  DataConfirmViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/08.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class DataConfirmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        _ = self.navigationController?.popToRootViewController(animated: false)
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
