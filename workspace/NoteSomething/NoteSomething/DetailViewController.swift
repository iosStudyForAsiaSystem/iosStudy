//
//  DetailViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var detailItem: GroupDbData?
    var detailWordItem: WordDbData?
    var detailImageItem: ImageData?
    var curDataType:DataType = .noneType

    //グループデータ生成ボタン
    @IBOutlet weak var addGroupBtn: UIButton!
    //単語またはイメージデータ生成ボタン
    @IBOutlet weak var addSubItemBtn: UIButton!
//{
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }

    func configureView() {
        // Update the user interface for the detail item.
        
        var titleString = "詳細"
        var titleAnotherItemBtnString = "同一タイプデータ生成"
        var titleSubItemBtnString = "サーブデータ生成"
        var isAnotherItemBtnEnabled = true
        var isSubItemBtnEnabled = true
        let label = self.detailDescriptionLabel
        
        if let detail = self.detailItem {

            label?.text = detail.description
            print(detail.description)
            
            curDataType = .groupType
            titleString = "グループ情報詳細"
            titleSubItemBtnString = "単語データ生成"
            titleAnotherItemBtnString = "グループデータ生成"
  
            
        } else if let detail2 = self.detailWordItem {
            

            label?.text = detail2.description
            print(detail2.description)
            curDataType = .wordType
            
            titleString = "単語情報詳細"
            titleSubItemBtnString = "イメージデータ生成"
            titleAnotherItemBtnString = "単語データ生成"

            
        } else if let detailImg = self.detailImageItem {
            label?.text = detailImg.description
            print(detailImg.description)
            
            curDataType = .imageType
            titleString = "イメージ情報詳細"
            
            isSubItemBtnEnabled = false
            isAnotherItemBtnEnabled = true
            
            titleAnotherItemBtnString = "イメージデータ生成"
        }
        self.addGroupBtn.setTitle(titleAnotherItemBtnString, for: .normal)
        self.addGroupBtn.isEnabled = isAnotherItemBtnEnabled
        self.addSubItemBtn.setTitle(titleSubItemBtnString, for: .normal)
        self.addSubItemBtn.isEnabled = isSubItemBtnEnabled
        
        self.title =  titleString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK : - Button Action
    
    @IBAction func onclickExitBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true){
            //画面を閉じる
        }
    }
    @IBAction func onClickCreateGroupData(_ sender: Any) {
        
        switch  self.curDataType  {
        case .allType:
            return
        default:
            break
        }
        self.presentDataInputVC( dataType: self.curDataType )
    }
    
    @IBAction func onClickCreateWordData(_ sender: Any) {
        switch  self.curDataType  {
        case .groupType:
            self.presentDataInputVC(self.detailItem?.id,  dataType: DataType.wordType)
            break
        case .wordType:
            self.presentDataInputVC(self.detailWordItem?.id,  dataType: DataType.imageType)
            break
        default:
            return
        }
        
    }
    
    func presentDataInputVC (_ parentId: String? = "", dataType: DataType) {
        
        print ("presentDataInputVC param:\(parentId ?? "")")
        
        let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)
        
        
        let dataInputVC: DataInputViewController = inputDataStoryboard.instantiateViewController(withIdentifier: "kihonDataInputVC") as! DataInputViewController
        
        let navigationController:UINavigationController = UINavigationController.init(rootViewController: dataInputVC)
        
        self.present(navigationController, animated: true) {
            //生成するデータタイプの設定
            dataInputVC.selectedType =  dataType
            //親情報の設定
            if parentId != nil || parentId != "" {
                
                dataInputVC.parentId = (grp:parentId!,word: "")
                
            } else {
                dataInputVC.parentId = ("","")
            }

        }
    }



}

