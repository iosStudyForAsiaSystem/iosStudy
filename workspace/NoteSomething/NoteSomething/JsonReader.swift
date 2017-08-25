//
//  JsonReader.swift
//  NoteSomething
//
//  Created by snowman on 2017/08/26.
//  Copyright © 2017年 snowman. All rights reserved.
//

import Foundation

let kCardDouroHyoujiTypeString = "douro_hyouji_card"

enum JsonReaderCardType {
    case douroHyoujiCardType
    case etc
    
    init(card: String) {
        if card == kCardDouroHyoujiTypeString {
            self = .douroHyoujiCardType
        } else {
            self = .etc
        }
    }
    
    func jsonFileString() -> String {
        switch self {
        case .douroHyoujiCardType:
            return kCardDouroHyoujiTypeString
        default:
            return ""
        }
    }
}

class JsonReader {
    
    static func printJsonData(jsonObject: [String: Any]) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            //print( "\(decoded),")
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:String] {
                print(dictFromJSON)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //example :"douro_hyouji_card1.json"
    static func parsedJsonForDouroHyoujiCard(cardGroupIndex: Int) -> NSData?  {
        let jsonReaderCardType: JsonReaderCardType = .douroHyoujiCardType
        let jsonFileString = jsonReaderCardType.jsonFileString() + "\(cardGroupIndex)"
        return parsedJson(jsonFile: jsonFileString)
    }
    
    static func parsedJson(jsonFile: String?) -> NSData? {
        
        guard let jsonFile = jsonFile else  { return nil }
        let path : String = Bundle.main.path(forResource: jsonFile, ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let parseredData : NSData = fileHandle.readDataToEndOfFile() as NSData
        //debug
        let jsonStr = NSString(data: parseredData as Data, encoding: String.Encoding.utf8.rawValue)
        print(jsonStr!)
        
        return parseredData
        
    }
}
