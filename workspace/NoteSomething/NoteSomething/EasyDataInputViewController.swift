//
//  EasyDataInputViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/14.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class EasyDataInputViewController: UIViewController {

    
    var results:CheckedInputDic?
    
    //group名
    //@IBOutlet weak var grpDataTitleL1: UILabel!
    @IBOutlet weak var grpDataInputText1: UITextField!
    //コメント
    //@IBOutlet weak var grpDataTitleL2: UILabel!
    @IBOutlet weak var grpDataInputText2: UITextField!
    //word
    //@IBOutlet weak var wordDtaTitleL1: UILabel!
    @IBOutlet weak var wordDataInputText1: UITextField!
    //コメント
    //@IBOutlet weak var wordDataTitleL2: UILabel!
    @IBOutlet weak var wordDataInputText2: UITextField!
    //image
    //@IBOutlet weak var imgDtaTitleL1: UILabel!
    @IBOutlet weak var imgDataInputText1: UITextField!
    //コメント
    //@IBOutlet weak var imgDataTitleL2: UILabel!
    @IBOutlet weak var imgDataInputText2: UITextField!
    //etc1
    //@IBOutlet weak var grpDataTitleEtc1L: UILabel!
    @IBOutlet weak var grpDataInputTextEtc1: UITextField!
    //etc2
    //@IBOutlet weak var grpDataTitleEtc2L: UILabel!
    @IBOutlet weak var grpDataInputTextEtc2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Segue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showInputConfirmSegue" {
            
            print("segue.identifier == showInputConfirmSegue")
            let confirmVc:DataConfirmViewController = segue.destination as! DataConfirmViewController
            confirmVc.results = results
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "showInputConfirmSegue" {
            
            print("shouldPerformSegue.identifier == showInputConfirmSegue")
            
            results = self.checkInputData()
            
            if (results != nil) , (results?.count)! > 0   {
                
                //show alert
                self.showAlertVc()
                return true
            }
            
        }
        return true

    }
 
    
    // MARK : - Button Action
    
    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
    }

    
    // MARK : - Custom
    func  checkInputData () -> CheckedInputDic {
        
        let groupNm = CustomUtil.checkFieldEmpty(self.grpDataInputText1.text!)
        let groupComment = CustomUtil.checkFieldEmpty(self.grpDataInputText2.text!)
        
        let groupEtc1 = CustomUtil.checkFieldEmpty(self.grpDataInputTextEtc1.text!)
        let groupEtc2 = CustomUtil.checkFieldEmpty(self.grpDataInputTextEtc2.text!)
        
        let wordNm = CustomUtil.checkFieldEmpty(self.wordDataInputText1.text!)
        let wordComment = CustomUtil.checkFieldEmpty(self.wordDataInputText2.text!)
        
        let imageNm = CustomUtil.checkFieldEmpty(self.imgDataInputText1.text!)
        let imageComment = CustomUtil.checkFieldEmpty(self.imgDataInputText2.text!)
        
        if groupNm.isEmpty || wordNm.isEmpty || imageNm.isEmpty {

            return [:]
        }
        
        var dataDic:CheckedInputDic = [:]
        
   
        dataDic["groupNm"] = groupNm
        dataDic["groupComment"] = groupComment
        dataDic["groupEtc1"] = groupEtc1
        dataDic["groupEtc2"] = groupEtc2
        dataDic["wordNm"] = wordNm
        dataDic["wordComment"] = wordComment
        dataDic["imageNm"] = imageNm
        dataDic["imageComment"] = imageComment
        
        
        return dataDic
    }
    
    func showAlertVc () {
        let alertVc:UIAlertController = UIAlertController(title: "error", message: "check input data", preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertVc.addAction(action)
        
        alertVc.show(self, sender: nil)
        
    }
    
}
