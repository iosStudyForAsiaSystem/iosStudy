//
//  CustomRealmDef.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/06.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation
import RealmSwift



class CustomRealmUtil: NSObject {
    
    static let sharedInstance = CustomRealmUtil()
    
    
    let dataRealm = try! Realm()
    
    //全グループのデータの数取得
    func findAllGroupsCount() -> Int {
        
        let currentGrpCount:Int = dataRealm.objects(GroupDbData.self).count
        
        print("findGroupsCount  : \(currentGrpCount)")
        
        return currentGrpCount
    }
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
    //ダミーグループ情報追加
    func makeAndInsertDummyGroupData () {
        
        let currentGrpCount = self.findAllGroupsCount()
        let nmJp:String = "group" +  String(currentGrpCount)
        let groupId:String = String( currentGrpCount + 1 )
        let type:String = String(describing: DataType.GroupType)
        
        let groupData = GroupDbData(value: ["id":groupId,"nmJp":nmJp, "comment": "", "type":type])
        groupData.imageNm = "groupImg"
        try! dataRealm.write() {
            dataRealm.add(groupData)
        }
    }
    
    //ダミー単語情報追加
    func makeAndInsertDummyWordData() -> String {
        return self.makeAndInsertDummyWordData(parentId: "")
    }
     //ダミー単語情報追加（親グループあり）
    func makeAndInsertDummyWordData(parentId:String) -> String {
        let currentWordCount = self.findAllWordsCount()
        let nmJp:String = "word" +  String(currentWordCount)
        let wordId:String = String( 1000 + currentWordCount + 1 )
        let type:String = String(describing: DataType.WordType)

        
        let wordData = WordDbData(value: ["id":wordId,"nmJp":nmJp, "comment": "", "type":type])
        wordData.imageNm = "wordImg"
        
        if parentId.characters.count > 0  {
            wordData.parentId = parentId
        }

        try! dataRealm.write() {
            dataRealm.add(wordData)
        }
        
        return wordId

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
    func findGroupDataFromGroupId(id : String ) -> GroupDbData? {
        
        let currentGrpCount = self.findAllGroupsCount()
        
        print("findGroupDataFromIndex param: \(id) , currentGrpCount: \(currentGrpCount)")
        
        let results = dataRealm.objects(GroupDbData.self).filter("id = %@ ", id)
        
        return results[0]
    }
    //単語情報取得（インデックス検索）
    func findWordDataFromIndex(index:Int ) -> WordDbData? {
        
        
        let currentWordCount = self.findAllWordsCount()
        
        print("findWordDataFromIndex param: \(index) , currentWordCount: \(currentWordCount)")
        
        let results = dataRealm.objects(WordDbData.self)
        
        if results.count > index {
            return (results[index])
        }
  
        return nil
    }
    //単語情報取得（ID検索）
    func findWordDataFromWordId(id:String ) -> WordDbData? {
        
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
    
    func setDefaultRealmForUser(username: String) {
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent("\(username).realm")
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }


    
}
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
    
    dynamic var imageNm: String  = ""
    
    
    func hasImage() ->Bool {
        if self.imageNm.characters.count > 0 {
            return true
        }
        return false
    }

    override class func primaryKey() -> String {
        return "id"
    }
}
//グループ情報定義
class GroupDbData : CommonDbInfo {
    
    
    let wordIdList =  List<WordDbData>()
    

    
    override var  description :String  {
        
        return "GroupDbData id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment)"
    }
}
//単語情報定義
class WordDbData : CommonDbInfo {
    
    //グループクラスのID
    dynamic var parentId: String  = ""
    let subImageNmList = List<ImageDbData>()
    
    override var  description :String  {
        
        return "WordDbData id : \(self.id) name:\( self.nmJp)   comment:  \(self.comment)"
    }
}
//イメージ情報定義
class ImageDbData : CommonDbInfo {
    
    //単語クラスのID
    dynamic var parentId: String  = ""
    
    dynamic var path :String = ""

    override var  description :String  {
        
        return "ImageDbData id : \(self.id) name:\( self.nmJp)   parentId:  \(self.parentId)"
    }
}
