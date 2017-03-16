//
//  CustomConst.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/06.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation


enum DataType:Int {
    case GroupType = 0
    case WordType
    case ImageType
    case AllType
    case NoneType
}

enum MenuSegment:Int
{
    case groupSegMenu = 0
    case wordSegMenu = 1
    case imageSegMenu = 2
    case easyAllSegMenu = 3
}


typealias CheckedInputTuple = (key:String,value:String)

typealias CheckedInputDic = [String:String]


 let kGroupNm =         "groupNm"
 let kGroupComment =    "groupComment"
 let kGroupEtc1 =       "groupEtc1"
 let kGroupEtc2 =       "groupEtc2"
 let kWordNm =          "wordNm"
 let kWordComment =     "wordComment"
 let kImageNm =         "imageNm"
 let kImageComment =    "imageComment"

