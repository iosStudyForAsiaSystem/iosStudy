//
//  CustomDataDef.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation
import UIKit


class CustomUtil: NSObject {
    
    static let sharedInstance = CustomUtil()
    
    var loadedPhotos:[Photo] = []
    
    var firstModalVc:Any?
    
    
    func loadPhotsData()  {
        
        CustomUtil.sharedInstance.loadedPhotos = PhotoDataSource.plist()
        
    }
    
    // MARK: - Util
    //===================
    
    static func  checkKeyTextFieldEmpty(_ field:UITextField) ->String {
        let param = field.text!
        return self.checkKeyFieldEmpty(param)
        
    }
    
    static func  checkKeyFieldEmpty(_ param:String?) ->String {
        
        guard let groupId = param, !groupId.isEmpty  else {
            return "tmp"
        }
        return param!
        
    }
    
    static func  checkTextFieldEmpty(_ field:UITextField) ->String {
        let param = field.text!
        return self.checkFieldEmpty(param)
        
    }
    
    static func  checkFieldEmpty(_ param:String? ) -> String {
        if let data = param, !data.isEmpty   {
            return data
        }
        return ""
    }
    
    static func  paletteImageToView(_ view:UIView, imageNm:String ) {
        
            view.backgroundColor = UIColor(patternImage: UIImage(named:imageNm)!)
    }
    
    
    static func showErrorAlertVc (_ target:UIViewController, message:String ) {
        let alertVc:UIAlertController = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertVc.addAction(action)
        
        alertVc.show(target, sender: nil)
        
    }
    
    //メニュー選択画面遷移
    static func presentMenuVC (_ target:UIViewController ) {
        
        
        let mainDataStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let menuCollectionVC: MenuCollectionViewController = mainDataStoryboard.instantiateViewController(withIdentifier: "MenuCollectionVC") as! MenuCollectionViewController
        
        
        target.present(menuCollectionVC, animated: true) {
            
        }
    }

    
}




class CommonInfo: NSObject  {
    
    var index : Int = 0
    var id : String = ""
    var nmJp : String = ""
    var nmEn : String = ""
    var nmKr : String = ""
    var comment : String = ""
    
    var etc1:String = ""
    var etc2:String = ""
    
    var type:DataType = DataType.noneType
    
    override init() {
        // ID 自動生成
        super.init()
    }
    convenience init(id:String) {
        
        self.init()
        self.id = id
        self.nmJp = ""
    }
    
   convenience init(id:String, name:String) {

        self.init()
        self.id = id
        self.nmJp = name
    }
    
    override var  description :String  {
      return "CommonInfo id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment)"
    }
    
}

class GroupData : CommonInfo {
    
 
    var imageNm: String  = ""
    var wordIdList: Array<String> = []
    
    override init() {
        super.init()
        let currentGrpCount = 0 //CustomUtil.sharedInstance.groupList.count
        self.nmJp = "group" +  String(currentGrpCount)
        self.id = String( currentGrpCount + 1 )
        self.type = DataType.groupType
        
    }
    convenience init(name:String) {
        self.init()
        self.nmJp = name
        
    }
    
    convenience init(imgNm:String )  {
        self.init()
        //イメージファイルが存在しない場合、設定しないこと。
        self.imageNm = imgNm
        
    }
    
    convenience init(wordData:WordData) {
        self.init()
        self.wordIdList.append(wordData.id)
        
    }
    convenience init(wordId:String) {
        self.init()
        self.wordIdList.append(wordId)
    }
    
    func hasImage() ->Bool {
        if self.imageNm.characters.count > 0 {
            return true
        }
        return false
    }
    
    override var  description :String  {
        
        return "GroupData id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment) wordIdList count : \(wordIdList.count)"
    }
    
    
}

//GroupData : WordData   = 1 : N

class WordData : CommonInfo {
    
    //グループクラスのID
    var parentId: String  = ""
    var subImageNmList: Array<String> = []
    
    var imageNm: String = ""
    
    override init() {
        super.init()
        let currentWordCount = 0 //CustomUtil.sharedInstance.wordList.count
        self.nmJp = "word" +  String(currentWordCount)
        self.id = String(1000 + currentWordCount + 1)
        self.type = DataType.wordType
    }
    
    convenience init(parentId:String )  {
        self.init()
        
        self.parentId = parentId
    
    }
    
    convenience init(imageData:ImageData) {
        self.init()
    
        self.subImageNmList.append(imageData.imageNm)
        
    }
    
    convenience init(imageName:String) {
        self.init()
        self.subImageNmList.append(imageName)
    }
    
    func hasImage() ->Bool {
        if self.imageNm.characters.count > 0 {
            return true
        }
        return false
    }
    
    override var  description :String  {
        
        return "WordData id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment)"
    }
    
}

//WordData : ImageData  = 1 : N

class ImageData : CommonInfo {
    
    //単語クラスのID
    var parentId: Int  = 0
    
    var imageNm : String = ""
    
    var path :String = ""
    
    
    init(imageNm:String )  {
        super.init()
        self.imageNm = imageNm
        self.type = DataType.imageType
        //TODO イメージファイルが存在しない場合、設定しないこと。
    }
    
    convenience init(imageNm:String, path:String )  {
        self.init(imageNm:imageNm)

        self.path = path
        //TODO イメージファイルが存在しない場合、設定しないこと。
    }
    
    override var  description :String  {
        
        return "ImageData id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment)"
    }
    
}



