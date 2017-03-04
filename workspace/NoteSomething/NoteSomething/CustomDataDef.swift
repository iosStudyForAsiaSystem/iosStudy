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
    
    
    func makeDummyGroupData() {
        let grpData:GroupData = GroupData()
        groupList.append(grpData.id)
        groupDic[grpData.id] = grpData
    }
    
    func makeDummyWordData () {
        let wordData:WordData = WordData()
        wordList.append(wordData.id)
        wordDic[wordData.id] = wordData
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
        print("findGroupDataFromIndex param \(id) , groupList.count \(groupDic.count)")
        return groupDic[id ]
    }
    
    func findWordDataFromWordId(id:String ) -> WordData? {
        
        return wordDic[id ]
       
    }
    

    
    
}

 class CommonInfo  {
    
    var index : Int = 0
    var id : String = ""
    var nmJp : String = ""
    var nmEn : String = ""
    var nmKr : String = ""
    var comment : String = ""
    
    var etc1:String = ""
    var etc2:String = ""
    
    init() {
        // ID 自動生成
    }
    init(id:String) {
        
        self.id = id
        self.nmJp = ""
    }
    
    init(id:String, name:String) {

        self.id = id
        self.nmJp = name
    }
    
    
}

class GroupData : CommonInfo {
    
 
    var imageNm: String  = ""
    var wordList: Array<WordData> = []
    
    override init() {
        super.init()
        let currentGrpCount = CustomUtil.sharedInstance.groupList.count
        self.nmJp = "group" +  String(currentGrpCount)
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
    
    init(wordData:WordData) {
        super.init()
        self.wordList.append(wordData)
        
    }
    
    func hasImage() ->Bool {
        if self.imageNm.characters.count > 0 {
            return true
        }
        return false
    }
    
    var  description :String  {
        
        return "GroupData name:\( self.nmJp)   comment:  \(self.comment)"
    }
    
    
}

//GroupData : WordData   = 1 : N

class WordData : CommonInfo {
    
    //グループクラスのID
    var parentId: Int  = 0
    var subImageList: Array<ImageData> = []
    
    var imageNm: String = ""
    
    override init() {
        super.init()
        let currentWordCount = CustomUtil.sharedInstance.wordList.count
        self.nmJp = "word" +  String(currentWordCount)
    }
    
    convenience init(parentId:Int )  {
        self.init()
        
        self.parentId = parentId
    
    }
    
    convenience init(imageData:ImageData) {
        self.init()
    
        self.subImageList.append(imageData)
        
    }
    
    func hasImage() ->Bool {
        if self.imageNm.characters.count > 0 {
            return true
        }
        return false
    }
    
    var  description :String  {
        
        return "WordData name:\( self.nmJp)   comment:  \(self.comment)"
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
        
        //TODO イメージファイルが存在しない場合、設定しないこと。
    }
    
    convenience init(imageNm:String, path:String )  {
        self.init(imageNm:imageNm)

        self.path = path
        //TODO イメージファイルが存在しない場合、設定しないこと。
    }
    
    var  description :String  {
        
        return "name:\( self.nmJp)   comment:  \(self.comment)"
    }
    
}



