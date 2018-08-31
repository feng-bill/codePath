//
//  GameScene.swift
//  Pong
//
//  Created by Bill Feng on 1/12/17.
//  Copyright © 2017 Bill Feng. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var main = SKSpriteNode()
    var enemy = SKSpriteNode()
    
    var topLabel = SKLabelNode()
    var botLabel = SKLabelNode()
    
    var score = [Int]()
    
    var isFinish: Bool = false
    var inProgress: Bool = false
    
    override func didMove(to view: SKView) {
        
        gameStart()
        
        topLabel = self.childNode(withName: "topLabel") as!SKLabelNode
        botLabel = self.childNode(withName: "botLabel") as!SKLabelNode
        
        ball  = self.childNode(withName: "ball")  as!SKSpriteNode
        main  = self.childNode(withName: "main")  as!SKSpriteNode
        enemy = self.childNode(withName: "enemy") as!SKSpriteNode
        
    //    ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    func gameStart() {
        score = [0,0]
        topLabel.text = "\(score[1])"
        botLabel.text = "\(score[0])"
    }
    
    func addScore(playerWhoWon: SKSpriteNode) {
        
        // CGPoint touchPoint = [touch locationInView: self.frame]
        
        isFinish = true
        inProgress = false
     
        if playerWhoWon == main {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else if playerWhoWon == enemy {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
            
        }
        
        topLabel.text = "\(score[1])"
        botLabel.text = "\(score[0])"
    }
    
    
    //Make paddle move to finger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (inProgress == false) {
            isFinish = false
            inProgress = true
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
 
        for touch in touches {
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0.1 ))
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0.1 ))
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //move AI with delay
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
        
        if (isFinish == true) {
            ball.position = CGPoint(x: 0, y: 0)
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        }
     
        if (ball.position.y <= main.position.y - 70) {
            addScore(playerWhoWon: enemy)
           
        }
        else if (ball.position.y >= enemy.position.y + 70) {
            addScore(playerWhoWon: main)

        }
        
        
    }
}
