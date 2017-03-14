//
//  CustomDataDef.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation


class CustomUtil: NSObject {
    
    static let sharedInstance = CustomUtil()
    
    var groupList:[String] = []
    
    var wordList:[String] = []
    
    var groupDic:[String:GroupData] = [:]
    
    var wordDic:[String:WordData] = [:]
    
    
    
    func findAllGroupsCount() -> Int {
        
        return groupList.count
    }
    
    func findAllWordsCount () -> Int {
        
        return wordList.count
        
    }
    func makeAndInsertDummyGroupData() {
        let grpData:GroupData = GroupData()
        groupList.append(grpData.id)
        groupDic[grpData.id] = grpData
    }
    
    func makeAndInsertDummyWordData ()  {
        let wordData:WordData = WordData()
        wordList.append(wordData.id)
        wordDic[wordData.id] = wordData
        
        print("makeAndInsertDummyWordData wordDic.count \(wordDic.count)")
        
    }
    
    
    func findGroupDataFromIndex(index:Int ) -> GroupData? {
        print("findGroupDataFromIndex param \(index) , groupList.count \(groupList.count)")
        
        if groupList.count > index {
            let data =  findGroupDataFromGroupId( id: groupList[index])
            
            print(data?.description ?? "GroupData ... ")
            
            return data
        }
        return nil
    }
    
    func findWordDataFromIndex(index:Int ) -> WordData? {
        
        if wordList.count > index {
            return findWordDataFromWordId(id: wordList[index])
        }
        return nil
    }
    
    func findGroupDataFromGroupId(id : String ) -> GroupData? {
        print("findGroupDataFromIndex param \(id) , groupDic.count \(groupDic.count)")
        return groupDic[id ]
    }
    
    func findWordDataFromWordId(id:String ) -> WordData? {
        
        print("findWordDataFromWordId param \(id) , wordDic.count \(wordDic.count)")
        return wordDic[id ]
       
    }
    
    func saveGroupData () {
        
        let userDefaults = UserDefaults.standard
        for keyString:String in groupDic.keys {
            userDefaults.setValue(groupDic[keyString], forKey: keyString)
        }
        userDefaults.synchronize()
    }
    
    
    
    // MARK: - Util
    //===================
    static func  checkKeyFieldEmpty(_ param:String?) ->String {
        
        guard let groupId = param, !groupId.isEmpty  else {
            return "tmp"
        }
        return param!
        
    }
    static func  checkFieldEmpty(_ param:String? ) -> String {
        if let data = param, !data.isEmpty   {
            return data
        }
        return ""
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
    
    var type:DataType = DataType.NoneType
    
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
        let currentGrpCount = CustomUtil.sharedInstance.groupList.count
        self.nmJp = "group" +  String(currentGrpCount)
        self.id = String( currentGrpCount + 1 )
        self.type = DataType.GroupType
        
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
        let currentWordCount = CustomUtil.sharedInstance.wordList.count
        self.nmJp = "word" +  String(currentWordCount)
        self.id = String(1000 + currentWordCount + 1)
        self.type = DataType.WordType
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
        self.type = DataType.ImageType
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



