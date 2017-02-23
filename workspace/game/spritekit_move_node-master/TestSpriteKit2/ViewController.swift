//
//  ViewController.swift
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SKViewを取得する。
        let skView = self.view as! SKView
        
        //SKViewと同じサイズのSKSceneインスタンスを生成する。
        //let scene = TestScene(size:skView.frame.size)
        let scene = TestScene(fileNamed: "TestScene")
        
        
        scene?.scaleMode = .aspectFill
        
        //現在シーンを設定する。
        skView.presentScene(scene)
        
    }
}
