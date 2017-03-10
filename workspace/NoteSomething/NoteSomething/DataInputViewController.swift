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

    var parentType:DataType = .NoneType
    //グループID
    var parentId:String? {
        didSet{
            //print("parentId didSet :\(oldId) -> \(parentId)")
            self.showParentName(self.parentId!)
            
        }
  
    }
    //親情報表示欄
    @IBOutlet weak var parentInfoL: UILabel!
    
    @IBOutlet weak var topConstraintForContainerView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showParentName("")

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
    
    // MARK : - Button Action
    

    @IBAction func onClickCancelBtn(_ sender: UIButton) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
    }
    
 
    //親情報を表示
    func showParentName (_ parentId:String) {
        
        print("showParentName param: \(parentId)" )
        
        if self.parentId == nil || parentId == "" {
            self.topConstraintForContainerView.constant =  2
        } else {
            self.topConstraintForContainerView.constant = 53
        }
        
        var parentNm = ""
        switch self.parentType {
        case .GroupType:
        
                parentNm = (RealmManager.sharedInstance.findGroupDataFromGroupId(id: parentId)?.id)!
                self.parentInfoL.text = "親グループ:\(parentNm)"
                break
            
        case .WordType:
            
                parentNm = (RealmManager.sharedInstance.findWordDataFromWordId(id: parentId)?.id)!
                self.parentInfoL.text = "親単語:\(parentNm)"
            break
        default:
            self.parentInfoL.text = ""
            break;
        }
        
        print("showParentName parentNm: \(parentNm)" )
        


    }
    

}
