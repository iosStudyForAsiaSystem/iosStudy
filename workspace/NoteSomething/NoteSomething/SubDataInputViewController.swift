//
//  SubDataInputViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/07.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class SubDataInputViewController: UIViewController {

    
    @IBOutlet weak var listTitleL: UILabel!
    @IBOutlet weak var listCountL: UILabel!
    @IBOutlet weak var showListBtn: UIButton!
    
    @IBOutlet weak var dataTitleL1: UILabel!
    @IBOutlet weak var dataInputText1: UITextField!
    
    @IBOutlet weak var dataTitleL2: UILabel!
    @IBOutlet weak var dataInputText2: UITextField!
    
    @IBOutlet weak var dataTitleL3: UILabel!
    @IBOutlet weak var dataInputText3: UITextField!
    
    @IBOutlet weak var dataTitleL4: UILabel!
    @IBOutlet weak var dataInputText4: UITextField!
    
    @IBOutlet weak var dataTitleL5: UILabel!
    @IBOutlet weak var dataInputText5: UITextField!
    
    @IBOutlet weak var dataTitleL6: UILabel!
    @IBOutlet weak var dataInputText6: UITextField!
    
    @IBOutlet weak var dataTitleL7: UILabel!
    @IBOutlet weak var dataInputText7: UITextField!
    
    
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

}

class GroupDataInputViewController:  SubDataInputViewController {
    
}

class WordDataInputViewController:  SubDataInputViewController {
    
}

class ImageDataInputViewController:  SubDataInputViewController {
    
}
