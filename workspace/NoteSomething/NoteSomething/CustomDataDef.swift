//
//  CustomDataDef.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation

protocol CommonInfo  {
    var index : Int {get set}
    var id : Int {get set}
    var nmJp : String {get set}
    var nmEn : String {get set}
    var nmKr : String {get set}
    var comment : String {get set}
}

class CustomData: NSObject {
    
    static let sharedInstance = CustomData()
    
    struct GroupData : CommonInfo {
        internal var comment: String

        internal var nmKr: String

        internal var nmEn: String

        internal var nmJp: String

        internal var id: Int

        internal var index: Int

        var imageNm: String
        var wordList: Array<WordData>
        
    }
    
    struct WordData : CommonInfo {
        internal var comment: String
        
        internal var nmKr: String
        
        internal var nmEn: String
        
        internal var nmJp: String
        
        internal var id: Int
        
        internal var index: Int
        
        var imageNm: Array<String>
        
        var etc1:String
        var etc2:String
        
    }

}
