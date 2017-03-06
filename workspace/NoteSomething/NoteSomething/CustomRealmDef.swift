//
//  CustomRealmDef.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/06.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation
import RealmSwift



class CustomDbUtil: NSObject {
    
    static let sharedInstance = CustomDbUtil()
    
    
    let dataRealm = try! Realm()
    
    func makeAndInsertDummyGroupData () {
        
        let currentGrpCount = dataRealm.objects(GroupDbData.self).count
        let nmJp:String = "group" +  String(currentGrpCount)
        let groupId:String = String( currentGrpCount + 1 )
        let type:String = String(describing: DataType.GroupType)
        
        let groupData = GroupDbData(value: ["id":groupId,"nmJp":nmJp, "comment": "", "type":type])
        try! dataRealm.write() {
            dataRealm.add(groupData)
        }
    }
    
    func makeAndInsertDummyWordData() {
        let currentWordCount = dataRealm.objects(WordDbData.self).count
        let nmJp:String = "word" +  String(currentWordCount)
        let wordId:String = String( 1000 + currentWordCount + 1 )
        let type:String = String(describing: DataType.WordType)
        
        let wordData = WordDbData(value: ["id":wordId,"nmJp":nmJp, "comment": "", "type":type])

        try! dataRealm.write() {
            dataRealm.add(wordData)
        }

    }
    
    func findGroupDataFromIndex(index:Int ) -> GroupDbData? {
        
        
        let currentGrpCount = dataRealm.objects(GroupDbData.self).count
        
        print("findGroupDataFromIndex param: \(index) , currentGrpCount: \(currentGrpCount)")
        
        let results = dataRealm.objects(GroupDbData.self)
        
        if results.count > index {
            return (results[index] )
        }
        return nil
    }
    
    func findWordDataFromIndex(index:Int ) -> WordDbData? {
        
        
        let currentWordCount = dataRealm.objects(WordDbData.self).count
        
        print("findWordDataFromIndex param: \(index) , currentWordCount: \(currentWordCount)")
        
        let results = dataRealm.objects(WordDbData.self)
        
        if results.count > index {
            return (results[index])
        }
  
        return nil
    }
    
    func findGroupDataFromGroupId(id : String ) -> GroupData? {

        let currentGrpCount = dataRealm.objects(GroupDbData.self).count
        
        print("findGroupDataFromIndex param: \(id) , currentGrpCount: \(currentGrpCount)")
        
        let results = dataRealm.objects(GroupDbData.self).filter("id = %@ ", id)
        
        return results[0]
    }
    
    func findWordDataFromWordId(id:String ) -> WordData? {
        
        let currentWordCount = dataRealm.objects(WordDbData.self).count
        
        print("findGroupDataFromGroupId param: \(id) , currentWordCount: \(currentWordCount)")
        
        let predicate = NSPredicate(format: "id = %@ ", id)
        let results = dataRealm.objects(WordDbData.self).filter(predicate)
        
        return results[0]
        
    }
    
    func sortGroupDataBy(item:String) {
        let keyString:String = String(format: "GroupDbData.%@", item)
        let result = dataRealm.objects(GroupDbData.self).sorted(byKeyPath:keyString )
        //TODO
    }

    
}
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

}

class GroupDbData : CommonDbInfo {
    
    dynamic var imageNm: String  = ""
    dynamic var wordIdList: Array<String> = []

}

class WordDbData : CommonDbInfo {
    
    //グループクラスのID
    dynamic var parentId: String  = ""
    dynamic var subImageNmList: Array<String> = []
    
    dynamic var imageNm: String = ""

}
