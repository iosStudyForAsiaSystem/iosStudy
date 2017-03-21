//
//  CustomPickerViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/21.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController {

    @IBOutlet weak var customPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickSelectionBtn(_ sender: Any) {
    }
    @IBAction func onClickCloseBtn(_ sender: Any) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
    }
}
