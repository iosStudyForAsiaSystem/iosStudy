//
//  RegistFinishViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/07.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class RegistFinishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onClickAddDataBtn(_ sender: UIButton) {
        //self.navigationController?.popToViewController((navigationController?.viewControllers[0])!, animated: false)
        _ = self.navigationController?.popToRootViewController(animated: false)
    }
    @IBAction func onClickBackListBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true) { 
            //自分を閉じる際に行うべき機能を追加
            //単語データを作成した場合、単語リストに戻る
            //グループデータを作成した場合、グループリストに戻る
            //イメージデータを作成した場合、。。。
        }
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
