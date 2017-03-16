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
        
        if segue.identifier == "DataInputCompleteSegue" {
            
            print("segue.identifier == DataInputCompleteVc")
            let completeVc:InputCompleteViewController = segue.destination as! InputCompleteViewController
            completeVc.dataNm = results?["groupNm"]
            completeVc.dataId = ""
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "DataInputCompleteSegue" {
            
            print("shouldPerformSegue.identifier == DataInputCompleteVc")
            
            //データ保存処理
            let realMgr = RealmManager.sharedInstance
            
            let grpNm:String?  = results?[kGroupNm]
            let wordNm:String? = results?[kWordNm]
            let imgNm:String?  = results?[kImageNm]
            var wordid:String = ""
            
            //group data
            let grpid = realMgr.makeAndInsertDummyGroupData(grpNm,
                                                            comment: results?[kGroupComment] )
            
            let dic:CheckedInputDic = ["etc1":results?[kGroupEtc1] ?? "",
                                       "etc2":results?[kGroupEtc2] ?? ""]
            realMgr.updateGroupDataFromGroupId(grpid, itemDic:dic)
            
            
            //word data
            if  !grpid.isEmpty && !((wordNm?.isEmpty)!) {
                
               wordid =  realMgr.makeAndInsertDummyWordData(grpid, inputNm:wordNm ,
                                                            comment: results?[kWordComment] )
               
            } else {
                wordid =  realMgr.makeAndInsertDummyWordData()
            }
            
            //image
            if  !wordid.isEmpty && !((imgNm?.isEmpty)!)  {
                let imgId = realMgr.makeAndInsertDummyImageData(wordid,inputNm:imgNm ,
                                                                comment: results?[kImageComment] )
                
                print("create imageid Id : \(imgId)")
            }
            
            let dbInfo = String(format: "group count:%d, word count:%d,image count:%d", realMgr.findAllGroupsCount(),
                                realMgr.findAllWordsCount(), realMgr.findAllImagesCount())
            print(dbInfo)
            
        }
        return true
        

    }
    
    // MARK: - Custom
    
    func showConfirmInfo() {
        //メッセージ内容生成
        
        let msg:String = String(format: "入力した%@情報は以下の通りです。\n%@,\n%@,\n%@,\n%@,\n%@,\n%@,\n%@,\n",
        "グループ名称　　　： \(results!["groupNm"] ?? "")",
        "グループコメント　：\(results!["groupComment"] ?? "")",
        "その他１ 　　　　：\(results!["groupEtc1"] ?? "")",
        "その他２ 　　　　：\(results!["groupEtc2"] ?? "")",
        "単語名称 　　　　：\(results!["wordNm"] ?? "")",
        "単語コメント 　　：\(results!["wordComment"] ?? "")",
        "イメージ名称 　　：\(results!["imageNm"] ?? "")",
        "イメージコメント ：\(results!["imageComment"] ?? "")")
        
        confirmTextv.text = msg
        
    }
    

}
