//
//  DataInputViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/07.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit



class DataInputViewController: UIViewController {

    //@IBOutlet weak var menuSegCtrl: UISegmentedControl!
    
    //let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)

    var selectedType:DataType = .NoneType
    //グループID
    var parentId:(grp:String, word:String)? {
        didSet{
            //print("parentId didSet :\(oldId) -> \(parentId)")
            self.showParentName(self.parentId)
            
        }
  
    }
    //親情報表示欄
    @IBOutlet weak var parentInfoL: UILabel!
    
    @IBOutlet weak var topConstraintForContainerView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showParentName(("",""))

        // Do any additional setup after loading the view.

   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - segue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "SubDataInputSegue" {
            
            let subDataInputVc = segue.destination  as! SubDataInputViewController
            // Pass data to secondViewController before the transition
            
            subDataInputVc.selectedType = self.selectedType
            
        }
    }
 
    
    // MARK : - Button Action
    

    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
    }
    
    // MARK : - Custom
 
    //親情報を表示
    func showParentName (_ parentId:(grp:String, word:String)? ) {
        
        print("showParentName param: \(parentId)" )
        
        let checkNullParam = (parentId?.grp == "" &&  parentId?.word == "")
        //let hasParam = (parentId?.grp != "" || parentId?.word == "")
        
        if self.parentId == nil ||  checkNullParam {
            self.topConstraintForContainerView.constant =  2
            parentInfoL.isHidden = true
        } else {
            self.topConstraintForContainerView.constant = 53
            parentInfoL.isHidden = false
            self.displayParentName(parentId!)
        }
    
    }
    func displayParentName (_ parentId:(grp:String, word:String)) {
    
        var parentNm :String?
        self.parentInfoL.text = ""

        if parentId.grp != "" {
                parentNm = RealmManager.sharedInstance.findGroupDataFromGroupId(parentId.grp)?.nmJp
                if parentNm == nil ||  parentNm == "" {
                    parentNm = "未指定"
                }
                self.parentInfoL.text = "親グループ:" + parentNm!
        } else if parentId.word != "" {
            
                parentNm = RealmManager.sharedInstance.findWordDataFromWordId(parentId.word)?.nmJp
                if parentNm == nil ||  parentNm == "" {
                    parentNm = "未指定"
                }
                self.parentInfoL.text = "親単語:" + parentNm!
   
        }
        
        print("displayParentName parentNm: \(parentNm)" )
        
    }

    

}
