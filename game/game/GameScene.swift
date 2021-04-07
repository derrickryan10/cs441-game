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
    
    let scoreLabel = SKLabelNode(fontNamed: "Futura")
    let gameArea: CGRect
    
    //game area
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
    
    //game
    override func didMove(to view: SKView) {
        
        scoreNumber = 0
        
        //background
        let background = SKSpriteNode(imageNamed: "bluebg.jpeg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        //first target
        let target = SKSpriteNode(imageNamed: "Target2")
        target.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        target.zPosition = 2
        target.name = "targetObject"
        self.addChild(target)
        
        //score
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.zPosition = 1
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
    }
    
    //spawn new target
    func spawnNewTarget(){
        var randomImageNumber = arc4random()%3
        randomImageNumber += 1
        
        //new target at random location
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
                if scoreNumber % 10 == 0{
                    spawnNewTarget()
                }
            }
        }
    }
}
