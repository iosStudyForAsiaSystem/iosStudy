//
//  RealmManager.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/06.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation
import RealmSwift



class RealmManager: NSObject {
    
    static let sharedInstance = RealmManager()
    
    
    let dataRealm = try! Realm()
    
    // MARK: - group data
    //===================
    
    //全グループのデータの数取得
    func findAllGroupsCount() -> Int {
        
        let currentGrpCount:Int = dataRealm.objects(GroupDbData.self).count
        
        print("findGroupsCount  : \(currentGrpCount)")
        
        return currentGrpCount
    }

    
    //ダミーグループ情報名称取得
    func makeDummyGroupName () -> String {
        
        let currentGrpCount = self.findAllGroupsCount()
        let nmJp:String = "group" +  String(currentGrpCount)
        
        return nmJp
    }
    //ダミーグループ情報追加
    func makeAndInsertDummyGroupData (_ grpNm: String? = "", comment:String? = "") -> String {
        
        var nmJp:String?
        if let nm = grpNm ,  nm.isEmpty {
            nmJp = self.makeDummyGroupName()
        } else {
            nmJp = grpNm
        }
        let currentGrpCount = self.findAllGroupsCount()
        let groupId:String = String( currentGrpCount + 1 )
        let type:String = String(describing: DataType.GroupType)
        
        let groupData = GroupDbData(value: ["id":groupId,"nmJp":nmJp, "comment": "", "type":type])
        groupData.thumnailNm = "groupImg"
        
        if (comment?.isEmpty)!  {
            groupData.comment = comment!
        }
        
        try! dataRealm.write() {
            dataRealm.add(groupData)
        }
        
        print("create groupid Id : \(groupId)")
        
        return groupId
    }
    
    //グループ情報取得（インデックス検索）
    func findGroupDataFromIndex(index:Int ) -> GroupDbData? {
        
        
        let currentGrpCount = self.findAllGroupsCount()
        
        print("findGroupDataFromIndex param: \(index) , currentGrpCount: \(currentGrpCount)")
        
        let results = dataRealm.objects(GroupDbData.self)
        
        if results.count > index {
            return (results[index] )
        }
        return nil
    }
    //グループ情報取得（ID検索）
    func findGroupDataFromGroupId(_ id : String ) -> GroupDbData? {
        
        //let currentGrpCount = self.findAllGroupsCount()
        //print("findGroupDataFromIndex currentGrpCount: \(currentGrpCount)")
        print("findGroupDataFromIndex param: \(id)" )
        
        let results = dataRealm.objects(GroupDbData.self).filter("id = %@ ", id)
        
        return results[0]
    }
    
    func updateGroupDataFromGroupId(_ id :String? , itemDic:CheckedInputDic) {
        
        guard  (id != nil) else {
            return
        }
        
        try! dataRealm.write() {
            let groupData = self.findGroupDataFromGroupId(id!)
            
            itemDic.forEach{key,value in
                print("updateGroupDataFromGroupId key\(key) value\(value)")
                groupData?.setValue(value, forKeyPath: key)
            }
        }
    }

    
    // MARK: - word data
    //===================
    
    //全単語のデータの数取得
    func findAllWordsCount () -> Int {
        
        let currentWordCount:Int = dataRealm.objects(WordDbData.self).count
        
        print("findWordsCount: \(currentWordCount)")
        
        return currentWordCount
        
    }
    
    
    
    //単語のデータ「親グループID所属」のリスト取得
    func findWordsCountWithSameGroup (parentId:String) -> [String] {
        
        let predicate = NSPredicate(format: "parentId = %@ ", parentId)
        let currentWordCount:Int = dataRealm.objects(WordDbData.self).filter(predicate).count
        
        print("findWordsCountWithSameGroup: \(currentWordCount)")
        
        let results =  dataRealm.objects(WordDbData.self).filter(predicate)
        
        var wordIdList:[String] = []
        for wordData:WordDbData in results {
            
            wordIdList.append(wordData.id)
        }
        
        return wordIdList
        
    }
    
    //ダミー単語情報名称取得
    func makeDummyWordName() -> String {
        let currentWordCount = self.findAllWordsCount()
        let nmJp:String = "word" +  String(currentWordCount)
        
        return nmJp
    }
    
    //ダミー単語情報追加
    func makeAndInsertDummyWordData() -> String {
        return self.makeAndInsertDummyWordData( "")
    }
    

     //ダミー単語情報追加（親グループあり）
    func makeAndInsertDummyWordData(_ parentId:String, inputNm:String? = "", comment:String? = "" ) -> String {
        
        var  nmJp:String = ""
        if inputNm == nil ,inputNm == "" {
            nmJp = self.makeDummyWordName()
        } else {
            nmJp = inputNm!
        }
        let currentWordCount = self.findAllWordsCount()
        let wordId:String = String( currentWordCount + 1 )
        let type:String = String(describing: DataType.WordType)

        
        let wordData = WordDbData(value: ["id":wordId,"nmJp":nmJp, "comment": "", "type":type])
        wordData.thumnailNm = "wordImg"
        
        if parentId != ""  {
            wordData.parentId = parentId
        }
        
        if (comment?.isEmpty)!  {
            wordData.comment = comment!
        }

        try! dataRealm.write() {
            dataRealm.add(wordData)
        }
        
        
        print("create wordId Id : \(wordId)")
        
        return wordId

    }

    //単語情報取得（インデックス検索）
    func findWordDataFromIndex(_ index:Int ) -> WordDbData? {
        
        
        let currentWordCount = self.findAllWordsCount()
        
        print("findWordDataFromIndex param: \(index) , currentWordCount: \(currentWordCount)")
        
        let results = dataRealm.objects(WordDbData.self)
        
        if results.count > index {
            return (results[index])
        }
  
        return nil
    }
    //単語情報取得（ID検索）
    func findWordDataFromWordId(_ id:String ) -> WordDbData? {
        
        let currentWordCount = self.findAllWordsCount()
        
        print("findGroupDataFromGroupId param: \(id) , currentWordCount: \(currentWordCount)")
        
        let predicate = NSPredicate(format: "id = %@ ", id)
        let results = dataRealm.objects(WordDbData.self).filter(predicate)
        
        return results[0]
        
    }
    
//    func sortGroupDataBy(item:String) {
//        let keyString:String = String(format: "GroupDbData.%@", item)
//        let result = dataRealm.objects(GroupDbData.self).sorted(byKeyPath:keyString )
//        //TODO
//    }
    
   // MARK: - image data
    //====================
    
    //全イメージのデータの数取得
    func findAllImagesCount () -> Int {
        
        let currentImageCount:Int = dataRealm.objects(ImageDbData.self).count
        
        print("findAllImagesCount: \(currentImageCount)")
        
        return currentImageCount
        
    }
    //ダミーイメージ情報名称取得
    func makeDummyImageName() -> String {
        let currentCount = self.findAllImagesCount()
        let nmJp:String = "image" +  String(currentCount)
        
        return nmJp
    }
    
    //ダミーイメージ情報追加
    func makeAndInsertDummyImageData() -> String {
        return self.makeAndInsertDummyImageData( "")
    }
    
    
    //ダミーイメージ情報追加（親単語あり）
    func makeAndInsertDummyImageData(_ parentId:String, inputNm:String? = "" , comment:String? = "") -> String {
        
        var  nmJp:String = ""
        if inputNm == nil ,  inputNm == "" {
            nmJp = self.makeDummyImageName()
        } else {
            nmJp = inputNm!
        }
        
        let currentCount = self.findAllWordsCount()
        let tmpId:String = String( currentCount + 1 )
        let type:String = String(describing: DataType.ImageType)
        
        
        let tmpData = ImageDbData(value: ["id":tmpId,"nmJp":nmJp, "comment": "", "type":type])
        tmpData.thumnailNm = "flower"
        
        if parentId.isEmpty  {
            tmpData.parentId = parentId
        }
        if (comment?.isEmpty)!  {
            tmpData.comment = comment!
        }
        
        try! dataRealm.write() {
            dataRealm.add(tmpData)
        }
        
        print("create imageid Id : \(tmpId)")
        
        return tmpId
        
    }
    
    //イメージ情報取得（ID検索）
    func findImageDataFromImageId(_ id:String ) -> ImageDbData? {
        
        let currentCount = self.findAllImagesCount()
        
        print("findImageDataFromImageId param: \(id) , currentCount: \(currentCount)")
        
        let predicate = NSPredicate(format: "id = %@ ", id)
        let results = dataRealm.objects(ImageDbData.self).filter(predicate)
        
        return results[0]
        
    }

    
    // MARK: - sort
    //====================
    
    func sortGroupDataBy(item:String) {
//        let keyString:String = String(format: "GroupDbData.%@", item)
//        let result = dataRealm.objects(GroupDbData.self).sorted(byKeyPath:keyString )
        //TODO
    }
    

    
    // MARK: - save user default data
    //====================
    
    func setDefaultRealmForUser(username: String) {
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent("\(username).realm")
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
    
}

// MARK: - define data class info
//====================
//共通情報定義
class CommonDbInfo: Object  {
    
    dynamic var index : Int = 0
    dynamic var id : String = ""
    dynamic var nmJp : String = ""
    dynamic var nmEn : String = ""
    dynamic var nmKr : String = ""
    dynamic var comment : String = ""
    
    dynamic var etc1:String = ""
    dynamic var etc2:String = ""
    
    dynamic var type = ""
    
    dynamic var thumnailNm: String  = ""
    
    
    func hasImage() ->Bool {
        if self.thumnailNm.characters.count > 0 {
            return true
        }
        return false
    }

    override class func primaryKey() -> String {
        return "id"
    }
}
//所属されたバーぶデータのID管理
class SubDataId :Object {
    //サブID
    dynamic var subDataId : String = ""
    dynamic var type : Int = DataType.NoneType.rawValue
}

//グループ情報定義
class GroupDbData : CommonDbInfo {
    
    
    //単語情報ID管理
    let wordIdList =  List<SubDataId>()
    let wordList   =  List<WordDbData>()

    override var  description :String  {
        
        return "GroupDbData id : \(self.id) \n name:\( self.nmJp)  \n comment:  \(self.comment) \n etc1:\(etc1) \n etc2:\(etc2)"
    }
}

//単語情報定義
class WordDbData : CommonDbInfo {
    
    //グループクラスのID
    dynamic var parentId: String  = ""
    //イメージ情報IDを管理
    let subImageIDList = List<SubDataId>()
    
    override var  description :String  {
        
        return "WordDbData id : \(self.id) \n name:\( self.nmJp)   \n comment:  \(self.comment) \n etc1:\(etc1) \n etc2:\(etc2)"
    }
}
//イメージ情報定義
class ImageDbData : CommonDbInfo {
    
    //単語クラスのID
    dynamic var parentId: String  = ""
    //ファイルパス
    dynamic var path :String = ""

    override var  description :String  {
        
        return "ImageDbData id : \(self.id) \n name:\( self.nmJp)  \n parentId:  \(self.parentId) \n comment:  \(self.comment) \n etc1:\(etc1) \n etc2:\(etc2)"
    }
}
