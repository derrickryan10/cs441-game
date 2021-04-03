//
//  GameScene.swift
//  game
//
//  Created by Derrick Ryan on 3/23/21.
//

import SpriteKit
import GameplayKit

var scoreNumber = 0

class GameScene: SKScene {
    
    let scoreLabel = SKLabelNode()
    
    //game area
    let gameArea: CGRect
    
    override init(size: CGSize){
        let maxAspeectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspeectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
    override func didMove(to view: SKView) {
        
        scoreNumber = 0
        
        //first target
        let target = SKSpriteNode(imageNamed: "Target1")
        target.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        target.zPosition = 2
        target.name = "targetObject"
        self.addChild(target)
        
        //score
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
    }
    
    //spawn new target
    func spawnNewTarget(){
        var randomImageNumber = arc4random()%3
        randomImageNumber += 1
        
        let target = SKSpriteNode(imageNamed: "Target\(randomImageNumber)")
        target.zPosition = 2
        target.name = "targetObject"
        
        let randomX = random(min: gameArea.minX + target.size.width/2, max: gameArea.maxX - target.size.width/2)
        let randomY = random(min: gameArea.minY + target.size.height/2, max: gameArea.maxY - target.size.height/2)
        
        target.position = CGPoint(x: randomX, y: randomY)
        self.addChild(target)
        
        //shrink
        target.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: 3),
            SKAction.run(runGameOver)
        ]))
    }
    
    //go to game over scene
    func runGameOver(){
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
    }
    
    //touch targets
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "targetObject"{
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                ]))
                
                spawnNewTarget()
                
                //update score
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
                
                //new levels
                if scoreNumber % 15 == 0{
                    spawnNewTarget()
                }
            }
        }
    }
    
    
    
    
    
    
}
    
    /*
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
*/
