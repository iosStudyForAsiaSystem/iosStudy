//
//  DataConfirmViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/08.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class DataConfirmViewController: UIViewController {

    
    var results:CheckedInputDic? {
        didSet {
            
        }
    }
    
    @IBOutlet weak var confirmTextv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.showConfirmInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        _ = self.navigationController?.popToRootViewController(animated: false)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //DataInputCompleteVc
        
        if segue.identifier == "DataInputCompleteVc" {
            
            print("segue.identifier == DataInputCompleteVc")
            let completeVc:InputCompleteViewController = segue.destination as! InputCompleteViewController
            completeVc.dataNm = results?["groupNm"]
            completeVc.dataId = ""
        }
    }
    
    // MARK: - Custom
    
    func showConfirmInfo() {
        //メッセージ内容生成
        
        let msg:String = String(format: "入力した%@情報は以下の通りです。\n　%@,\n%@,\n%@,\n%@,\n%@,\n%@,\n%@,\n",
        " \(results!["groupNm"] ?? "")",
        "groupComment \(results!["groupComment"] ?? "")",
        "groupEtc1 \(results!["groupEtc1"] ?? "")",
        "groupEtc2 \(results!["groupEtc2"] ?? "")",
        "wordNm \(results!["wordNm"] ?? "")",
        "wordComment \(results!["wordComment"] ?? "")",
        "imageNm \(results!["imageNm"] ?? "")",
        "imageComment \(results!["imageComment"] ?? "")")
        
        confirmTextv.text = msg
        
    }
    

}
