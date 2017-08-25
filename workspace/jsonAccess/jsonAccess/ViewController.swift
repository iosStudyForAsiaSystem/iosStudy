//
//  ViewController.swift
//  jsonAccess
//
//  Created by snowman on 2017/08/26.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readJsonData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func makeSampleJson() {
        
        Array(1...10).forEach {
            
            let subIndex = $0
            let index = ("index", "\(subIndex)")
            let group = ("group", "1")
            let image = ("image", "douro-hyouji-card\(group.1)-\(subIndex).png")
            let fileName = ("file", "道路標識カード\(group.1)-\(subIndex)")
            let id = ("id", "douro-card\(group.1)-\(subIndex).png")
            
            
            let jsonObject: [String: Any] = [
                index.0: index.1,
                id.0: id.1,
                fileName.0: fileName.1,
                image.0:image.1,
                "isActive": "1",
                group.0: group.1
            ]
            printJsonData(jsonObject: jsonObject)
        }
    }
    
    func printJsonData(jsonObject: [String: Any]) {
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
    
    func readJsonData() {
        
        let path : String = Bundle.main.path(forResource: "douro_hyouji_card1", ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile() as NSData
        let jsonStr = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
        print(jsonStr!)
        
    }


}

