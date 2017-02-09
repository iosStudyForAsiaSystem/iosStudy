//
//  SecondViewController.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func debug_print() {
        
        let msg = "こんにちは"
        let boy = 12
        let girl = 10
        let array = ["a", "b", "c"]
        

        
        // 出力する
        print(msg)
        print(boy, girl) // 複数の値をカンマで区切る
        print("男子 \(boy)、女子 \(girl)", terminator: " ---- ") // 改行しない
        print("合計 \(boy + girl)人")
        print(array) // 配列
    }
    
    func debug_var () {
        var kokugo:Int
        var sansu:Int
        var goukei:Int
        kokugo = 56
        sansu = 67
        goukei = kokugo + sansu
        print(goukei)
    }
    
    func separator() {
        let msg1 = "こんにちは"
        let msg2 = "ありがとう"
        let msg3 = "さようなら"
        print(msg1, msg2, msg3, separator:"／")
    }
    
    func kuji() {
        // 1〜10の乱数を作る
        let num = arc4random_uniform(10)+1
        // numの値で処理を分岐する
        if num>=7 {
            // numが7以上の時
            let msg = "あたり"
            print(num, msg)
        } else {
            // numが7未満の時
            let msg = "はずれ"
            print(num, msg)
        }
    }
    
    func tuple_type () {
    
        var product:( String, Int)
        product    = ("Swift", 2014)
            
        var guest:(String, String, Int)
        guest = ("大重", "おおしげ", 1234)

        print(guest, product)
    }
    
    func tuple_item() {
        
        
        // タプルの値を取り出す
        let data = (1000, 80)
        let (price, tax) = data
        let kingaku = price + tax
        print(kingaku)
        
    }
    
    func tuple_index () {
        
        // インデックス番号で変更する
        var user = ("鈴木", 29)
        user.1 = 30
        print(user)
        
    }
    
    func tuple_label () {

        // ラベルと型を指定したタプル
        
        var user:(name:String, age:Int, isPass:Bool)
        user.name = "高田"
        user.age = 23
        user.isPass = true
        print(user)
        print(user.age)
    }
}

