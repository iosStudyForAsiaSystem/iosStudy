//
//  DataInputViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/07.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit



class DataInputViewController: UIViewController {

    @IBOutlet weak var menuSegCtrl: UISegmentedControl!
    
    let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)
    
    var subDataInputVC: SubDataInputViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.subDataInputVC = self.inputDataStoryboard.instantiateViewController(withIdentifier: "SubDataInputVC") as? SubDataInputViewController

   
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
    
    // MARK : - Button Action
    

    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
    }
    
 
    

}
