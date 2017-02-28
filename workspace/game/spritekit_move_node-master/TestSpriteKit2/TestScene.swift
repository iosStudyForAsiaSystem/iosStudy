//
//  TestScene.swift
//

import Foundation
import SpriteKit

class TestScene:SKScene {
  
    var birdNode:SKSpriteNode!
    
    //現在シーン設定時の呼び出しメソッド
    override func didMove(to view: SKView) {
        //self.addChildNode(to: view)
        
        //let pinkBird = self.childNode(withName: "pink_bird") as? SKSpriteNode
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        //self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.0)
    }
    
    //画面タッチ時の呼び出しメソッド
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  
        //タッチした座標を取得する。
        let location = touches.first!.location(in: self)
        
        //SKSファイルに配置した鳥ノードを取得する。
        let bird = self.childNode(withName: "bird1") as? SKSpriteNode
    
        let pinkBird = self.childNode(withName: "pink_bird") as? SKSpriteNode
        
        let nodes = self.nodes(at: location)
        
        for node in nodes {
            if node == bird {
      
                break
            } else if node == pinkBird {
                self.dropDown(node: pinkBird)
                return
            }
        }
        
        
        
        self.moveAround(location: location, node: bird!)


        
    }
    
    func dropDown (node:SKSpriteNode?) {
    
         node?.physicsBody = SKPhysicsBody(texture: (node?.texture)!, size: (node?.size)!)
    }
    
    func moveAround (location:CGPoint , node:SKSpriteNode?) {
        
        //タッチした位置まで移動するアクションを作成する。
        let action = SKAction.move(to: CGPoint(x:location.x, y:location.y), duration:1.0)
        //アクションを実行する。
        node?.run(action)
    }
    
    func addChildNode(to view: SKView) {
    
        //背景画像のノードを作成する。
        let backNode = SKSpriteNode(imageNamed: "mountain")
        
        //背景画像のサイズをシーンと同じにする。
        backNode.size = self.frame.size
        
        //背景画像の位置をシーンの中央にする。
        backNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY);
        
        
        //鳥のノードを作成する。
        birdNode = SKSpriteNode(imageNamed: "bird1")
        
        //鳥の位置をシーンの中央にする。
        birdNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY);
        
        
        //ノードをシーンに追加する。
        self.addChild(backNode)
        self.addChild(birdNode)
    }
}
