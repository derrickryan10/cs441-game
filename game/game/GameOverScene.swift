//
//  GameOverScene.swift
//  game
//
//  Created by Derrick Ryan on 3/24/21.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    override func didMove(to view: SKView) {
        //let background = SKSpriteNode(imageNamed: "DiscsBackground")
        //background.size = self.size
        //background.zPosition = 0
        //background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //self.addChild(background)
        
        //let gameOverLabel = SKLabelNode(fontNamed: "Pusab")
        let gameOverLabel = SKLabelNode()
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 140
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        //gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        //score
        let finalScoreLabel = SKLabelNode()
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 70
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        finalScoreLabel.zPosition = 1
        //finalScoreLabel.fontColor = SKColor.white
        self.addChild(finalScoreLabel)
        
        //high score
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        //save high score
        if scoreNumber > highScoreNumber{
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        //high score label
        let highScoreLabel = SKLabelNode()
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 70
        //highScoreLabel.fontColor = SKColor.white
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(highScoreLabel)
        
        //restart button
        let restartLabel = SKLabelNode()
        restartLabel.text = "Restart"
        restartLabel.fontSize = 75
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restartLabel.name = "restartButton"
        self.addChild(restartLabel)
        
        //exit button
        let exitLabel = SKLabelNode()
        exitLabel.text = "Exit"
        exitLabel.fontSize = 75
        exitLabel.zPosition = 1
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
    }
    
    //button taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "restartButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "exitButton"{
                let sceneToMoveTo = MenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
}
