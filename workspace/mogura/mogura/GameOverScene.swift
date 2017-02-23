//
//  GameOverScene.swift
//  mogura
//
//  Copyright © 2015年 shoeisha. All rights reserved.
//

import SpriteKit

class GameOverScene : SKScene {
    
    var button: SKSpriteNode?
    var score: Int = 0
    
    // シーンが表示された時に呼ばれる
    override func didMove(to view: SKView) {
        
        // 背景画像のスプライトを配置する
        let background = SKSpriteNode(imageNamed: "bg_result")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        addChild(background)
        
        
        // 得点のラベルを配置する
        let scoreLabel1 = SKLabelNode (fontNamed: "ArialRoundedMYBold")
        scoreLabel1.fontSize = 40
        scoreLabel1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel1.text = "SCORE"
        scoreLabel1.fontColor = UIColor.black
        scoreLabel1.position = CGPoint(x: self.size.width * 0.5, y: 470)
        addChild(scoreLabel1)
        
        let scoreLabel2 = SKLabelNode (fontNamed: "ArialRoundedMYBold")
        scoreLabel2.fontSize = 80
        scoreLabel2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel2.text = "\(score)"
        scoreLabel2.fontColor = UIColor.red
        scoreLabel2.position = CGPoint(x: self.size.width * 0.5, y: 380)
        addChild(scoreLabel2)
        
        // もう一度遊ぶボタンを配置する
        let button = SKSpriteNode(imageNamed: "btn_replay")
        button.position = CGPoint(x: self.size.width * 0.5, y: 200)
        addChild(button)
        self.button = button
    }
    
    // タッチイベント
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            
            // タッチされた場所の座標を取得.
            let location = touch.location(in: self)
            
            // タッチされたノードを得る
            let touchNode = self.atPoint(location)
            
            if touchNode == button {
                let gameScene = GameScene(size: size)
                let skView = view as SKView!
                gameScene.scaleMode = SKSceneScaleMode.aspectFit
                skView?.presentScene(gameScene)
            }
        }
    }
}
