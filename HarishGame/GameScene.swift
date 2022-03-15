//
//  GameScene.swift
//  HarishGame
//
//  Created by Bill Richards on 3/15/22.
//

import SpriteKit
import GameplayKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {

    override func didMove(to view: SKView) {
        
        print("minX: \(frame.minX), maxX: \(frame.maxX)")

        for _ in 0..<45 {
            let randomX = Int.random(in: Int(frame.minX)..<Int(frame.maxX))
            let node = createNode(position: CGPoint(x: CGFloat(randomX), y: frame.midY))
            addChild(node)
        }
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -1.62)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    func createNode(position: CGPoint) -> SKSpriteNode {
        let node = SKSpriteNode(color: .random(), size: CGSize(width: 20, height: 20))
        node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
        node.physicsBody?.allowsRotation = true
        node.physicsBody?.isDynamic = true
        node.physicsBody?.affectedByGravity = true
        node.physicsBody?.restitution = 1
        node.physicsBody?.friction = 1
        node.position = position
        return node
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
