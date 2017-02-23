//: Playground - noun: a place where people can play

import UIKit
import SpriteKit
import XCPlayground

let width:CGFloat = 400
let height:CGFloat = 400
let canvasWidth: UInt32 = UInt32(width)
let canvasHeight: UInt32 = UInt32(height)

let rect:CGRect = CGRect(x: 0, y: 0, width: width, height: height)
let size:CGSize = CGSize(width: width, height: height)

let view:SKView = SKView(frame:rect)

let scene:SKScene = SKScene(size:size)

scene.backgroundColor = SKColor.black
view.presentScene(scene)

//重力加速度を設定1
scene.physicsWorld.gravity = CGVector(dx: 0, dy: -1)
//重力加速度を設定2
//scene.physicsWorld.gravity = CGVector(dx: -9.8, dy: 0)

//○の数
let maxObject = 10
for i in 1...maxObject {
    
    let radius:CGFloat = 6
    let shape = SKShapeNode(circleOfRadius:radius)
    shape.fillColor = SKColor.blue
    shape.position = CGPoint(
        x: CGFloat(arc4random_uniform(canvasWidth)),
        y: CGFloat(arc4random_uniform(canvasHeight)))
    scene.addChild(shape)
    
    shape.physicsBody = SKPhysicsBody(circleOfRadius:radius)

    //物理パラメータ
    //摩擦
    shape.physicsBody?.friction = 0.00001
    //反発力
    shape.physicsBody?.restitution = 0.99
    //質量
    shape.physicsBody?.mass = 1.0
    //重力無視
    //shape.physicsBody?.isDynamic = false

    let rect:CGRect = CGRect(x: 0, y: 0, width: width, height: height)
    //物理法則適用
    scene.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)

}

 XCPlaygroundPage.currentPage.liveView = view



//    shape.physicsBody.friction = 0.01
//    shape.physicsBody.restitution = 0.99
//    shape.physicsBody.mass = 1.0
//}
//
//scene.physicsBody = SKPhysicsBody(
//    edgeLoopFromRect:CGRect(x:0, y:0, width:width, height:height))
//
//XCPShowView("my view", view)

