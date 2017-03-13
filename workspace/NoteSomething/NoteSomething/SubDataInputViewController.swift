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
    
    //項目名
    @IBOutlet weak var dataTitleL1: UILabel!
    @IBOutlet weak var dataInputText1: UITextField!
    //タイトル1
    @IBOutlet weak var dataTitleL2: UILabel!
    @IBOutlet weak var dataInputText2: UITextField!
    //タイトル2
    @IBOutlet weak var dataTitleL3: UILabel!
    @IBOutlet weak var dataInputText3: UITextField!
    //タイトル3
    @IBOutlet weak var dataTitleL4: UILabel!
    @IBOutlet weak var dataInputText4: UITextField!
    //コメント
    @IBOutlet weak var dataTitleL5: UILabel!
    @IBOutlet weak var dataInputText5: UITextField!
    //etc1
    @IBOutlet weak var dataTitleL6: UILabel!
    @IBOutlet weak var dataInputText6: UITextField!
    //etc2
    @IBOutlet weak var dataTitleL7: UILabel!
    @IBOutlet weak var dataInputText7: UITextField!
    
    @IBOutlet weak var menuSegCtrl: UISegmentedControl!
    
    var tmpGrpData:GroupDbData?
    var tmpWordData:WordDbData?
    var tmpImgData:ImageDbData?
    
    let dummyKeyString = "tmp"
    
    var selectedType:DataType = .NoneType {
        didSet {
            self.adjustSegmentControl()
        }
    }
    
    var selectedSegCtrlIndex:MenuSegment = .groupSegMenu {
        
        didSet(oldValue) {
            print("selectedSegCtrlIndex didSet :\(oldValue) -> \(selectedSegCtrlIndex)")
            self.changeView(self.selectedSegCtrlIndex)
            
            
        }
        willSet (selectedValue){
            print("selectedSegCtrlIndex willSet:\(selectedSegCtrlIndex) -> \(selectedValue)")
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearScreenInfo()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セグメント変更に合わせて画面再表示
    func changeView(_ changeValue:MenuSegment) {
        self.clearScreenInfo()
        
        switch  changeValue  {
        case .groupSegMenu :
            self.configureGrpView()
            break
        case .wordSegMenu :
            self.configureWordView()
            break
        case .imageSegMenu:
            self.configureImageView()
            break
        }

    }
    func configureGrpView() {
        self.dataTitleL1.text = "グループ名称："
        self.listTitleL.text = "単語リストの数："
        self.handleShowListButtonPart(true)
        self.restoreEditGrpInfo()
    }
    
    func configureWordView() {
        self.dataTitleL1.text = "単語名称："
        self.listTitleL.text = "イメージリストの数："
        self.handleShowListButtonPart(true)
        self.restoreEditWordInfo()
    }
    
    func configureImageView() {
        self.dataTitleL1.text = "イメージ名称："
        self.handleShowListButtonPart(false)
        self.restoreEditImageInfo()
    }
    
    func handleShowListButtonPart(_ show:Bool) {
        self.listCountL.isHidden = !show
        self.listTitleL.isHidden = !show
        self.showListBtn.isHidden = true
    }
  
    func saveTempData() {
        
        switch  self.selectedSegCtrlIndex  {
        case .groupSegMenu :
            self.saveTmpGroupData()
            break
        case .wordSegMenu :
            self.saveTmpWordData()
            break
        case .imageSegMenu:
            self.saveTmpImageData()
            break
        }
        
    }
    
    //グループ情報の仮保管
    func saveTmpGroupData() {
        
        let groupId = self.checkKeyFieldEmpty(self.dataInputText1.text!)
        
        print(groupId)
        
        self.tmpGrpData = GroupDbData(value:["id":groupId])
        
        self.tmpGrpData?.nmJp       =  self.checkFieldEmpty(self.dataInputText2.text!)
        self.tmpGrpData?.comment    =  self.checkFieldEmpty(self.dataInputText5.text!)
        self.tmpGrpData?.etc1       =  self.checkFieldEmpty(self.dataInputText6.text!)
        self.tmpGrpData?.etc2       =  self.checkFieldEmpty(self.dataInputText7.text!)
        
    }
    
    func  checkKeyFieldEmpty(_ param:String?) ->String {
        
        guard let groupId = param, !groupId.isEmpty  else {
             return dummyKeyString
        }
        return param!

    }
    func  checkFieldEmpty(_ param:String? ) -> String {
        if let data = param, !data.isEmpty   {
           return data
        }
        return ""
    }

    
    func restoreEditGrpInfo () {
    
        if self.tmpGrpData?.id != dummyKeyString {
            self.dataInputText1.text = self.tmpGrpData?.id
        }
        
        
         self.dataInputText2.text = self.tmpGrpData?.nmJp
         self.dataInputText5.text = self.tmpGrpData?.comment
         self.dataInputText6.text = self.tmpGrpData?.etc1
         self.dataInputText7.text = self.tmpGrpData?.etc2
    }
    
    //グループ情報の仮保管
    func saveTmpWordData() {
        
        let wordId = self.checkKeyFieldEmpty(self.dataInputText1.text!)
        
        print(wordId)
        
        self.tmpWordData = WordDbData(value:["id":wordId])
        self.tmpWordData?.nmJp       =  self.checkFieldEmpty(self.dataInputText2.text!)
        self.tmpWordData?.comment    =  self.checkFieldEmpty(self.dataInputText5.text!)
        self.tmpWordData?.etc1       =  self.checkFieldEmpty(self.dataInputText6.text!)
        self.tmpWordData?.etc2       =  self.checkFieldEmpty(self.dataInputText7.text!)
        
    }
    
    func restoreEditWordInfo () {
        if self.tmpWordData?.id != dummyKeyString {
            self.dataInputText1.text = self.tmpWordData?.id
        }
        
        self.dataInputText2.text = self.tmpWordData?.nmJp
        self.dataInputText5.text = self.tmpWordData?.comment
        self.dataInputText6.text = self.tmpWordData?.etc1
        self.dataInputText7.text = self.tmpWordData?.etc2
    }
    
    //イメージ情報の仮保管
    func saveTmpImageData() {
    
        
        let  imageId = self.checkKeyFieldEmpty(self.dataInputText1.text!)
        
        self.tmpImgData = ImageDbData(value:["id":imageId])
        self.tmpImgData?.nmJp       =  self.checkFieldEmpty(self.dataInputText2.text!)
        self.tmpImgData?.comment    =  self.checkFieldEmpty(self.dataInputText5.text!)
        self.tmpImgData?.etc1       =  self.checkFieldEmpty(self.dataInputText6.text!)
        self.tmpImgData?.etc2       =  self.checkFieldEmpty(self.dataInputText7.text!)
        
    }
    
    func restoreEditImageInfo () {
        if self.tmpImgData?.id != dummyKeyString {
            self.dataInputText1.text = self.tmpImgData?.id
        }
        self.dataInputText2.text = self.tmpImgData?.nmJp
        self.dataInputText5.text = self.tmpImgData?.comment
        self.dataInputText6.text = self.tmpImgData?.etc1
        self.dataInputText7.text = self.tmpImgData?.etc2
    }
    
    func clearScreenInfo () {
        self.dataInputText1.text = " "
        
        self.dataInputText2.text = " "
        self.dataInputText3.text = " "
        self.dataInputText4.text = " "
        self.dataInputText5.text = " "
        self.dataInputText6.text = " "
        self.dataInputText7.text = " "
        
        //self.handleShowListButtonPart(false)
    }
    
    func adjustSegmentControl () {
        
        switch self.selectedType {
        case .GroupType:
            //選択
            menuSegCtrl.selectedSegmentIndex = 0
            break
        case .WordType:
            //選択
            menuSegCtrl.selectedSegmentIndex = 1
            
            break
        default:
            menuSegCtrl.selectedSegmentIndex = UISegmentedControlNoSegment
            break;
        }
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //セグメントコントローラのアクション
    @IBAction func onValueChangedMenuSegCtrl(_ sender: UISegmentedControl) {
        
        let menu:MenuSegment =  MenuSegment(rawValue: sender.selectedSegmentIndex)!
        
        //以前のセグメント変更に合わせて画面再表示
        self.saveTempData()
        
        self.selectedSegCtrlIndex = menu
        
    }
    


}
